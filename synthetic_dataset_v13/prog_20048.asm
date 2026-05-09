; DESCRIPTION: Draws a blue circle centered at (155, 64) with radius 50.
; PLAN: r0=155(x), r1=64(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 64
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
