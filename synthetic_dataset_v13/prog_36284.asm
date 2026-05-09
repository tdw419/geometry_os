; DESCRIPTION: Draws a green circle centered at (153, 156) with radius 71.
; PLAN: r0=153(x), r1=156(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 156
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
