; DESCRIPTION: Renders a orange disk with center (409, 140) and radius 77.
; PLAN: r0=409(x), r1=140(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 140
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
