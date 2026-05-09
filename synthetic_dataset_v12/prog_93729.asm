; DESCRIPTION: Draws a blue circle centered at (411, 132) with radius 59.
; PLAN: r0=411(x), r1=132(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 132
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
