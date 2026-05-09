; DESCRIPTION: Creates a black circular shape at (236, 83) with radius 73.
; PLAN: r0=236(x), r1=83(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 83
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
