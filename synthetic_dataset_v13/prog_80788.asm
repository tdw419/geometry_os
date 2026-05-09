; DESCRIPTION: Creates a black circular shape at (100, 66) with radius 58.
; PLAN: r0=100(x), r1=66(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 66
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
