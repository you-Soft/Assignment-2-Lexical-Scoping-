## The following functions calculate the inverse of a matrix and saves it
## to the cache such that the next time the user attempts to calculate the
## matrix inverse, the previously saved value is returned instead of
## repeating the calculation.

## This function creates a special "matrix" object, which is really a list 
## containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        ## create a matrix object x
        ## define the cache
        cache <- NULL

        setMatrix <- function(newValue) {

                x <<- newValue## assign the input matrix (newValue) to the variable x in the
      
                cache <<- NULL## re-initialize cache in the parent environment to null
        }

        getMatrix <- function() {
                x ## return the matrix x
        }
        cacheInverse <- function(solve) {
                cache <<- solve
        }
      
        getInverse <- function() {
                cache## return the cached inverse of x
        }
        
        
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

## The following function calculates the inverse 
## with the above function. However, it first checks to see if the inverse
## and sets the value of the inverse in the cache via the 'setinverse' function.
cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()
        if(!is.null(inverse)) {
                message("getting cached data")

                ## Return a matrix that is the inverse of 'x'
                return(inverse)
        }
        data <- x$getMatrix()
        inverse <- solve(data)
        x$cacheInverse(inverse)
        inverse
}
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help