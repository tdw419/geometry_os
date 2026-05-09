; DESCRIPTION: Draws a green circle centered at (77, 158) with radius 66.
; PLAN: r0=77(x), r1=158(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 158
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
