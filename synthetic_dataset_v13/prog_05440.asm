; DESCRIPTION: Renders a orange disk with center (53, 144) and radius 41.
; PLAN: r0=53(x), r1=144(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 144
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
