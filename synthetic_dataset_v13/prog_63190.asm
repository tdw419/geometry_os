; DESCRIPTION: Creates a orange circular shape at (41, 84) with radius 14.
; PLAN: r0=41(x), r1=84(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 84
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
