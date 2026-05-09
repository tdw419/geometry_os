; DESCRIPTION: Creates a green circular shape at (356, 89) with radius 57.
; PLAN: r0=356(x), r1=89(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 89
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
