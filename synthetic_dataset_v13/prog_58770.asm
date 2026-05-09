; DESCRIPTION: Draws a black circle centered at (350, 216) with radius 15.
; PLAN: r0=350(x), r1=216(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 216
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
