; DESCRIPTION: Draws a blue circle centered at (157, 132) with radius 55.
; PLAN: r0=157(x), r1=132(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 132
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
