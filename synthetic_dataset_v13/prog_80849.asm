; DESCRIPTION: Creates a black circular shape at (13, 77) with radius 12.
; PLAN: r0=13(x), r1=77(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 13
LDI r1, 77
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
