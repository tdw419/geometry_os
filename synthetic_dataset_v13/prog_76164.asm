; DESCRIPTION: Creates a orange circular shape at (334, 122) with radius 44.
; PLAN: r0=334(x), r1=122(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 122
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
