; DESCRIPTION: Draws a purple circle centered at (216, 110) with radius 32.
; PLAN: r0=216(x), r1=110(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 110
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
