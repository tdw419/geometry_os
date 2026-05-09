; DESCRIPTION: Creates a orange circular shape at (421, 66) with radius 37.
; PLAN: r0=421(x), r1=66(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 66
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
