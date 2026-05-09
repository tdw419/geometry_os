; DESCRIPTION: Draws a purple circle centered at (105, 68) with radius 34.
; PLAN: r0=105(x), r1=68(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 68
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
