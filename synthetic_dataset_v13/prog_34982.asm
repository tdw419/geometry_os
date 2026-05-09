; DESCRIPTION: Creates a red circular shape at (174, 55) with radius 41.
; PLAN: r0=174(x), r1=55(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 55
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
