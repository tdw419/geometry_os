; DESCRIPTION: Draws a blue circle centered at (421, 58) with radius 35.
; PLAN: r0=421(x), r1=58(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 58
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
