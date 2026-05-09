; DESCRIPTION: Renders a orange disk with center (112, 50) and radius 37.
; PLAN: r0=112(x), r1=50(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 50
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
