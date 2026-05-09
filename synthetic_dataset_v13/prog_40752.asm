; DESCRIPTION: Places a cyan circle of radius 34 at center (41, 193).
; PLAN: r0=41(x), r1=193(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 193
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
