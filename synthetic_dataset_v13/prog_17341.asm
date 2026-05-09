; DESCRIPTION: Draws a blue circle centered at (473, 89) with radius 17.
; PLAN: r0=473(x), r1=89(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 89
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
