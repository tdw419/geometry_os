; DESCRIPTION: Creates a orange circular shape at (332, 157) with radius 75.
; PLAN: r0=332(x), r1=157(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 157
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
