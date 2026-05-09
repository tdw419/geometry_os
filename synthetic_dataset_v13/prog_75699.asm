; DESCRIPTION: Creates a cyan circular shape at (324, 112) with radius 41.
; PLAN: r0=324(x), r1=112(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 112
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
