; DESCRIPTION: Draws a magenta circle centered at (397, 219) with radius 10.
; PLAN: r0=397(x), r1=219(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 219
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
