; DESCRIPTION: Places a cyan circle of radius 41 at center (78, 112).
; PLAN: r0=78(x), r1=112(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 112
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
