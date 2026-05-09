; DESCRIPTION: Renders a orange disk with center (199, 85) and radius 18.
; PLAN: r0=199(x), r1=85(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 85
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
