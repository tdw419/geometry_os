; DESCRIPTION: Creates a black circular shape at (357, 162) with radius 22.
; PLAN: r0=357(x), r1=162(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 162
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
