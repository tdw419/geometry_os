; DESCRIPTION: Renders a orange disk with center (155, 87) and radius 12.
; PLAN: r0=155(x), r1=87(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 87
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
