; DESCRIPTION: Creates a red circular shape at (466, 114) with radius 41.
; PLAN: r0=466(x), r1=114(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 114
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
