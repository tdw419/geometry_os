; DESCRIPTION: Creates a cyan circular shape at (471, 136) with radius 41.
; PLAN: r0=471(x), r1=136(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 136
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
