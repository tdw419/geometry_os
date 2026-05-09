; DESCRIPTION: Creates a orange circular shape at (157, 88) with radius 30.
; PLAN: r0=157(x), r1=88(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 88
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
