; DESCRIPTION: Draws a blue circle centered at (155, 57) with radius 43.
; PLAN: r0=155(x), r1=57(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 57
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
