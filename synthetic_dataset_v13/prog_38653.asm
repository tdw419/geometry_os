; DESCRIPTION: Places a black circle of radius 41 at center (385, 191).
; PLAN: r0=385(x), r1=191(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 191
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
