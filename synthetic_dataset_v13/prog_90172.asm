; DESCRIPTION: Creates a white circular shape at (41, 207) with radius 18.
; PLAN: r0=41(x), r1=207(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 207
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
