; DESCRIPTION: Places a purple circle of radius 41 at center (232, 45).
; PLAN: r0=232(x), r1=45(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 45
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
