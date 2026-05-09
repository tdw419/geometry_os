; DESCRIPTION: Creates a black circular shape at (315, 156) with radius 14.
; PLAN: r0=315(x), r1=156(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 156
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
