; DESCRIPTION: Creates a orange circular shape at (134, 89) with radius 62.
; PLAN: r0=134(x), r1=89(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 89
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
