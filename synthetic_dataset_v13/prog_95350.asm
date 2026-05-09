; DESCRIPTION: Creates a white circular shape at (356, 179) with radius 51.
; PLAN: r0=356(x), r1=179(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 179
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
