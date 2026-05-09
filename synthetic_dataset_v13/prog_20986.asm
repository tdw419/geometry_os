; DESCRIPTION: Creates a yellow circular shape at (155, 110) with radius 20.
; PLAN: r0=155(x), r1=110(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 110
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
