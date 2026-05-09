; DESCRIPTION: Draws a green circle centered at (435, 183) with radius 15.
; PLAN: r0=435(x), r1=183(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 183
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
