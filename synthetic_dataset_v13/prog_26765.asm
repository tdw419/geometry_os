; DESCRIPTION: Creates a black circular shape at (405, 90) with radius 73.
; PLAN: r0=405(x), r1=90(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 90
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
