; DESCRIPTION: Draws a purple circle centered at (334, 144) with radius 76.
; PLAN: r0=334(x), r1=144(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 144
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
