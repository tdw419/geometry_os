; DESCRIPTION: Draws a blue circle centered at (122, 63) with radius 13.
; PLAN: r0=122(x), r1=63(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 63
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
