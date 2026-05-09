; DESCRIPTION: Creates a black circular shape at (135, 109) with radius 77.
; PLAN: r0=135(x), r1=109(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 109
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
