; DESCRIPTION: Draws a green circle centered at (114, 98) with radius 69.
; PLAN: r0=114(x), r1=98(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 98
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
