; DESCRIPTION: Draws a blue circle centered at (84, 58) with radius 47.
; PLAN: r0=84(x), r1=58(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 58
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
