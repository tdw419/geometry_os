; DESCRIPTION: Draws a green circle centered at (66, 183) with radius 32.
; PLAN: r0=66(x), r1=183(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 183
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
