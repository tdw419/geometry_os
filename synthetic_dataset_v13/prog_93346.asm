; DESCRIPTION: Draws a green circle centered at (119, 109) with radius 21.
; PLAN: r0=119(x), r1=109(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 109
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
