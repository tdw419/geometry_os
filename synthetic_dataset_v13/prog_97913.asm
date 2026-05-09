; DESCRIPTION: Renders a orange disk with center (435, 148) and radius 41.
; PLAN: r0=435(x), r1=148(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 148
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
