; DESCRIPTION: Creates a black circular shape at (477, 80) with radius 28.
; PLAN: r0=477(x), r1=80(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 80
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
