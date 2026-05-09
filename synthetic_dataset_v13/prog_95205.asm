; DESCRIPTION: Creates a orange circular shape at (62, 168) with radius 31.
; PLAN: r0=62(x), r1=168(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 168
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
