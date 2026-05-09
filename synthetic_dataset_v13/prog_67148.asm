; DESCRIPTION: Creates a yellow circular shape at (200, 217) with radius 22.
; PLAN: r0=200(x), r1=217(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 217
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
