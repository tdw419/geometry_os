; DESCRIPTION: Draws a green circle centered at (211, 106) with radius 68.
; PLAN: r0=211(x), r1=106(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 106
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
