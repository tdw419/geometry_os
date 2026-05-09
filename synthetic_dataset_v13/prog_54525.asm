; DESCRIPTION: Creates a orange circular shape at (421, 157) with radius 52.
; PLAN: r0=421(x), r1=157(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 157
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
