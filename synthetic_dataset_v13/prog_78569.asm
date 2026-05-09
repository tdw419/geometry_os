; DESCRIPTION: Creates a orange circular shape at (99, 128) with radius 76.
; PLAN: r0=99(x), r1=128(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 128
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
