; DESCRIPTION: Places a black circle of radius 41 at center (355, 210).
; PLAN: r0=355(x), r1=210(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 210
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
