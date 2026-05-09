; DESCRIPTION: Creates a green circular shape at (118, 89) with radius 73.
; PLAN: r0=118(x), r1=89(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 89
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
