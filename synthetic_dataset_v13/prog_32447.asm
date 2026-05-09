; DESCRIPTION: Places a yellow circle of radius 41 at center (378, 52).
; PLAN: r0=378(x), r1=52(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 52
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
