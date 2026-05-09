; DESCRIPTION: Draws a purple circle centered at (364, 88) with radius 77.
; PLAN: r0=364(x), r1=88(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 88
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
