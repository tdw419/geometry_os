; DESCRIPTION: Draws a blue circle centered at (117, 136) with radius 73.
; PLAN: r0=117(x), r1=136(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 136
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
