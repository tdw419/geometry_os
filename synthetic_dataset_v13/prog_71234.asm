; DESCRIPTION: Creates a black circular shape at (135, 89) with radius 16.
; PLAN: r0=135(x), r1=89(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 89
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
