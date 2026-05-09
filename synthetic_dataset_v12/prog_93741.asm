; DESCRIPTION: Creates a orange circular shape at (399, 114) with radius 33.
; PLAN: r0=399(x), r1=114(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 114
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
