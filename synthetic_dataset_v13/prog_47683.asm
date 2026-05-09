; DESCRIPTION: Creates a orange circular shape at (431, 51) with radius 41.
; PLAN: r0=431(x), r1=51(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 51
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
