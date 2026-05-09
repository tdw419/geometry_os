; DESCRIPTION: Draws a blue circle centered at (334, 23) with radius 17.
; PLAN: r0=334(x), r1=23(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 23
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
