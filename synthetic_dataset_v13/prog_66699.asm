; DESCRIPTION: Draws a green circle centered at (246, 136) with radius 77.
; PLAN: r0=246(x), r1=136(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 136
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
