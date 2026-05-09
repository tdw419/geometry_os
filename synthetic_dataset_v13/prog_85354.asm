; DESCRIPTION: Creates a black circular shape at (179, 218) with radius 16.
; PLAN: r0=179(x), r1=218(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 218
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
