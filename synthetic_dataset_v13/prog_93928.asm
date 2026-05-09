; DESCRIPTION: Creates a orange circular shape at (95, 45) with radius 41.
; PLAN: r0=95(x), r1=45(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 45
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
