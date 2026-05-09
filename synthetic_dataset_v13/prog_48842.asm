; DESCRIPTION: Draws a green circle centered at (455, 88) with radius 53.
; PLAN: r0=455(x), r1=88(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 88
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
