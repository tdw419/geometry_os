; DESCRIPTION: Creates a black circular shape at (86, 51) with radius 26.
; PLAN: r0=86(x), r1=51(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 51
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
