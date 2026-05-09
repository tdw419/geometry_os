; DESCRIPTION: Creates a black circular shape at (253, 122) with radius 42.
; PLAN: r0=253(x), r1=122(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 122
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
