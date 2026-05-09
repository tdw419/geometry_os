; DESCRIPTION: Creates a green circular shape at (266, 186) with radius 41.
; PLAN: r0=266(x), r1=186(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 186
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
