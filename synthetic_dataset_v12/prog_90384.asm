; DESCRIPTION: Renders a white disk with center (287, 90) and radius 41.
; PLAN: r0=287(x), r1=90(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 90
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
