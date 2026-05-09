; DESCRIPTION: Creates a orange circular shape at (131, 42) with radius 21.
; PLAN: r0=131(x), r1=42(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 42
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
