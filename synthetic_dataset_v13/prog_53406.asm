; DESCRIPTION: Renders a orange disk with center (125, 100) and radius 45.
; PLAN: r0=125(x), r1=100(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 100
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
