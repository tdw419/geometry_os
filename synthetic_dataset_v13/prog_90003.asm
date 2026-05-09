; DESCRIPTION: Creates a black circular shape at (104, 68) with radius 42.
; PLAN: r0=104(x), r1=68(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 68
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
