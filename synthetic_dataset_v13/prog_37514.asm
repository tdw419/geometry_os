; DESCRIPTION: Renders a yellow disk with center (233, 210) and radius 41.
; PLAN: r0=233(x), r1=210(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 210
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
