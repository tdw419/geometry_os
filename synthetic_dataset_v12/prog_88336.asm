; DESCRIPTION: Renders a orange disk with center (427, 106) and radius 17.
; PLAN: r0=427(x), r1=106(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 106
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
