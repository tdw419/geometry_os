; DESCRIPTION: Draws a green circle centered at (457, 118) with radius 27.
; PLAN: r0=457(x), r1=118(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 118
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
