; DESCRIPTION: Renders a orange disk with center (227, 125) and radius 46.
; PLAN: r0=227(x), r1=125(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 125
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
