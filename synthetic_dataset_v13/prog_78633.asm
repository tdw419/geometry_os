; DESCRIPTION: Creates a black circular shape at (52, 118) with radius 51.
; PLAN: r0=52(x), r1=118(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 118
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
