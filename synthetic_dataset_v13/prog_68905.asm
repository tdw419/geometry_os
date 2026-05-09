; DESCRIPTION: Creates a black circular shape at (48, 245) with radius 11.
; PLAN: r0=48(x), r1=245(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 245
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
