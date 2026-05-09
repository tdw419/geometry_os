; DESCRIPTION: Renders a black disk with center (215, 72) and radius 41.
; PLAN: r0=215(x), r1=72(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 72
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
