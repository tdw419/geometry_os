; DESCRIPTION: Places a black circle of radius 41 at center (125, 164).
; PLAN: r0=125(x), r1=164(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 164
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
