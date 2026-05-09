; DESCRIPTION: Renders a orange disk with center (119, 134) and radius 47.
; PLAN: r0=119(x), r1=134(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 134
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
