; DESCRIPTION: Draws a purple circle centered at (203, 148) with radius 77.
; PLAN: r0=203(x), r1=148(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 148
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
