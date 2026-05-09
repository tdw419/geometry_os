; DESCRIPTION: Creates a white circular shape at (424, 174) with radius 41.
; PLAN: r0=424(x), r1=174(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 174
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
