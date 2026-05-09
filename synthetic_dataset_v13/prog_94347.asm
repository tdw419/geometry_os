; DESCRIPTION: Draws a blue circle centered at (330, 139) with radius 66.
; PLAN: r0=330(x), r1=139(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 139
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
