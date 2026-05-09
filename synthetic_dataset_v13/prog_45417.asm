; DESCRIPTION: Draws a blue circle centered at (481, 232) with radius 13.
; PLAN: r0=481(x), r1=232(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 232
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
