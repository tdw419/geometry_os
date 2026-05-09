; DESCRIPTION: Renders a orange disk with center (109, 109) and radius 62.
; PLAN: r0=109(x), r1=109(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 109
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
