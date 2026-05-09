; DESCRIPTION: Creates a cyan circular shape at (253, 47) with radius 41.
; PLAN: r0=253(x), r1=47(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 47
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
