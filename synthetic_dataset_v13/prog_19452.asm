; DESCRIPTION: Creates a yellow circular shape at (155, 106) with radius 47.
; PLAN: r0=155(x), r1=106(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 106
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
