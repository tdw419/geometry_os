; DESCRIPTION: Places a red circle of radius 34 at center (41, 97).
; PLAN: r0=41(x), r1=97(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 97
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
