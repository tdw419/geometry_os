; DESCRIPTION: Places a orange circle of radius 41 at center (153, 115).
; PLAN: r0=153(x), r1=115(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 115
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
