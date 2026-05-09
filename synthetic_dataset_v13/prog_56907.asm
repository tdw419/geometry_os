; DESCRIPTION: Creates a orange circular shape at (14, 42) with radius 11.
; PLAN: r0=14(x), r1=42(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 42
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
