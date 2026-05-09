; DESCRIPTION: Creates a green circular shape at (390, 100) with radius 21.
; PLAN: r0=390(x), r1=100(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 100
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
