; DESCRIPTION: Creates a red circular shape at (339, 46) with radius 41.
; PLAN: r0=339(x), r1=46(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 46
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
