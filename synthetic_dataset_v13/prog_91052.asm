; DESCRIPTION: Renders a orange disk with center (462, 56) and radius 38.
; PLAN: r0=462(x), r1=56(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 56
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
