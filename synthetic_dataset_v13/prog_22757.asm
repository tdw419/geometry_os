; DESCRIPTION: Creates a black circular shape at (115, 49) with radius 46.
; PLAN: r0=115(x), r1=49(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 49
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
