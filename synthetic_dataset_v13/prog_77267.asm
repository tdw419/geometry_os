; DESCRIPTION: Renders a blue disk with center (245, 53) and radius 41.
; PLAN: r0=245(x), r1=53(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 53
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
