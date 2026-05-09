; DESCRIPTION: Creates a white circular shape at (420, 62) with radius 41.
; PLAN: r0=420(x), r1=62(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 62
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
