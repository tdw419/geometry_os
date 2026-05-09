; DESCRIPTION: Creates a black circular shape at (124, 124) with radius 42.
; PLAN: r0=124(x), r1=124(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 124
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
