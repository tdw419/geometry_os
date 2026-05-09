; DESCRIPTION: Draws a green circle centered at (115, 183) with radius 46.
; PLAN: r0=115(x), r1=183(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 183
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
