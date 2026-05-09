; DESCRIPTION: Draws a purple circle centered at (459, 100) with radius 39.
; PLAN: r0=459(x), r1=100(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 100
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
