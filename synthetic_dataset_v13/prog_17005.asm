; DESCRIPTION: Renders a black disk with center (370, 41) and radius 33.
; PLAN: r0=370(x), r1=41(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 41
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
