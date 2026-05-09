; DESCRIPTION: Draws a purple circle centered at (79, 192) with radius 20.
; PLAN: r0=79(x), r1=192(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 192
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
