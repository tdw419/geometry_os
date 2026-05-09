; DESCRIPTION: Creates a cyan circular shape at (41, 103) with radius 18.
; PLAN: r0=41(x), r1=103(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 103
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
