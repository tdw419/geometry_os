; DESCRIPTION: Renders a purple disk with center (275, 121) and radius 41.
; PLAN: r0=275(x), r1=121(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 121
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
