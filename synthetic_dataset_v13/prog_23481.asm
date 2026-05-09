; DESCRIPTION: Draws a green circle centered at (258, 114) with radius 38.
; PLAN: r0=258(x), r1=114(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 114
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
