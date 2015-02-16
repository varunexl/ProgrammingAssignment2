 Skip to content
This repository

    Explore
    Gist
    Blog
    Help

    varunexl varunexl

    1 

1

    42,866

sefakilic/coursera-rprog-assignment2 forked from rdpeng/ProgrammingAssignment2

coursera-rprog-assignment2/cachematrix.R
Sefa Kilic sefakilic on 27 Apr 2014
solution added

2 contributors
Roger D. Peng Sefa Kilic
62 lines (54 sloc) 1.773 kb
# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.
# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
x <<- y
inv <<- NULL
}
get <- function() x
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}
# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.
# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
inv <- x$getinverse()
if(!is.null(inv)) {
message("getting cached data.")
return(inv)
}
data <- x$get()
inv <- solve(data)
x$setinverse(inv)
inv
}
## Sample run:
## > x = rbind(c(1, -1/4), c(-1/4, 1))
## > m = makeCacheMatrix(x)
## > m$get()
## [,1] [,2]
## [1,] 1.00 -0.25
## [2,] -0.25 1.00
## No cache in the first run
## > cacheSolve(m)
## [,1] [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
## Retrieving from the cache in the second run
## > cacheSolve(m)
## getting cached data.
## [,1] [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
## >

    Status
    API
    Training
    Shop
    Blog
    About

    © 2015 GitHub, Inc.
    Terms
    Privacy
    Security
    Contact

