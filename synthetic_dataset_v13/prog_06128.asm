; DESCRIPTION: Draws a blue circle centered at (216, 216) with radius 19.
; PLAN: r0=216(x), r1=216(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 216
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
