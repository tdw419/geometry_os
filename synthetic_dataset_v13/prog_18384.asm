; DESCRIPTION: Draws a blue circle centered at (139, 175) with radius 21.
; PLAN: r0=139(x), r1=175(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 175
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
