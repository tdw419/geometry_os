; DESCRIPTION: Renders a purple disk with center (296, 171) and radius 41.
; PLAN: r0=296(x), r1=171(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 171
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
