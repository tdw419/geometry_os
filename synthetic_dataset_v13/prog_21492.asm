; DESCRIPTION: Renders a white disk with center (188, 101) and radius 41.
; PLAN: r0=188(x), r1=101(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 101
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
