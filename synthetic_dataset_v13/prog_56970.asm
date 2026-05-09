; DESCRIPTION: Creates a orange circular shape at (134, 73) with radius 36.
; PLAN: r0=134(x), r1=73(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 73
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
