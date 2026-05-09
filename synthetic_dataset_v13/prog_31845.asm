; DESCRIPTION: Draws a green circle centered at (97, 24) with radius 15.
; PLAN: r0=97(x), r1=24(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 24
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
