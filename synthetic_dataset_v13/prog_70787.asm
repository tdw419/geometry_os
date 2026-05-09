; DESCRIPTION: Renders a orange disk with center (253, 74) and radius 41.
; PLAN: r0=253(x), r1=74(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 74
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
