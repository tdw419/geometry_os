; DESCRIPTION: Creates a black circular shape at (196, 179) with radius 48.
; PLAN: r0=196(x), r1=179(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 179
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
