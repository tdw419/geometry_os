; DESCRIPTION: Places a yellow circle of radius 41 at center (427, 73).
; PLAN: r0=427(x), r1=73(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 73
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
