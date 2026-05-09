; DESCRIPTION: Draws a purple circle centered at (19, 216) with radius 16.
; PLAN: r0=19(x), r1=216(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 216
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
