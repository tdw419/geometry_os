; DESCRIPTION: Creates a black circular shape at (71, 118) with radius 37.
; PLAN: r0=71(x), r1=118(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 118
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
