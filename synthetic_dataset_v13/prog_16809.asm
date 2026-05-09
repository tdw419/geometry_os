; DESCRIPTION: Creates a white circular shape at (215, 77) with radius 41.
; PLAN: r0=215(x), r1=77(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 77
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
