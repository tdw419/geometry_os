; DESCRIPTION: Creates a green circular shape at (109, 89) with radius 75.
; PLAN: r0=109(x), r1=89(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 89
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
