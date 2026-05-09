; DESCRIPTION: Creates a orange circular shape at (134, 57) with radius 11.
; PLAN: r0=134(x), r1=57(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 57
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
