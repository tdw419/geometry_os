; DESCRIPTION: Creates a orange circular shape at (442, 119) with radius 42.
; PLAN: r0=442(x), r1=119(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 119
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
