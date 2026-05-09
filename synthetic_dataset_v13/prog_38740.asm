; DESCRIPTION: Draws a green circle centered at (185, 109) with radius 78.
; PLAN: r0=185(x), r1=109(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 109
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
