; DESCRIPTION: Creates a orange circular shape at (100, 72) with radius 39.
; PLAN: r0=100(x), r1=72(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 72
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
