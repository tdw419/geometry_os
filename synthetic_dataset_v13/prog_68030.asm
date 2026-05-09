; DESCRIPTION: Creates a white circular shape at (306, 194) with radius 41.
; PLAN: r0=306(x), r1=194(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 194
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
