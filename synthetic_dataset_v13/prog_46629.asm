; DESCRIPTION: Creates a red circular shape at (70, 66) with radius 41.
; PLAN: r0=70(x), r1=66(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 66
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
