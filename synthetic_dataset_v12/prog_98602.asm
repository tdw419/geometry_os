; DESCRIPTION: Renders a black disk with center (300, 41) and radius 17.
; PLAN: r0=300(x), r1=41(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 41
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
