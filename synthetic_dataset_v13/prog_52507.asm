; DESCRIPTION: Renders a orange disk with center (274, 78) and radius 50.
; PLAN: r0=274(x), r1=78(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 78
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
