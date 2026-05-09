; DESCRIPTION: Creates a black circular shape at (247, 96) with radius 58.
; PLAN: r0=247(x), r1=96(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 96
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
