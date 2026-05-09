; DESCRIPTION: Draws a blue circle centered at (157, 22) with radius 19.
; PLAN: r0=157(x), r1=22(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 22
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
