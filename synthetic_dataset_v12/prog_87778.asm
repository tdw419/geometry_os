; DESCRIPTION: Draws a green circle centered at (183, 81) with radius 73.
; PLAN: r0=183(x), r1=81(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 81
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
