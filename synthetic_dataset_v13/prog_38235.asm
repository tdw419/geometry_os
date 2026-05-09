; DESCRIPTION: Draws a green circle centered at (105, 163) with radius 66.
; PLAN: r0=105(x), r1=163(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 163
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
