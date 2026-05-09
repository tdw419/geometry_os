; DESCRIPTION: Renders a orange disk with center (109, 123) and radius 50.
; PLAN: r0=109(x), r1=123(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 123
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
