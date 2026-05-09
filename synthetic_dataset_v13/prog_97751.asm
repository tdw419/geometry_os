; DESCRIPTION: Creates a black circular shape at (388, 179) with radius 68.
; PLAN: r0=388(x), r1=179(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 179
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
