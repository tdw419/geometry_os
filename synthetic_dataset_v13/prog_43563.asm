; DESCRIPTION: Places a black circle of radius 41 at center (339, 155).
; PLAN: r0=339(x), r1=155(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 155
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
