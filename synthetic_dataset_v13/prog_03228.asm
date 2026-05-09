; DESCRIPTION: Creates a black circular shape at (405, 119) with radius 42.
; PLAN: r0=405(x), r1=119(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 119
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
