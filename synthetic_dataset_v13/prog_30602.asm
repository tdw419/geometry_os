; DESCRIPTION: Draws a green circle centered at (253, 88) with radius 37.
; PLAN: r0=253(x), r1=88(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 88
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
