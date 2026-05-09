; DESCRIPTION: Draws a green circle centered at (106, 156) with radius 53.
; PLAN: r0=106(x), r1=156(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 156
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
