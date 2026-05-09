; DESCRIPTION: Creates a green circular shape at (276, 198) with radius 41.
; PLAN: r0=276(x), r1=198(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 198
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
