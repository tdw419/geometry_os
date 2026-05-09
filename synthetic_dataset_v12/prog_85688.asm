; DESCRIPTION: Renders a orange disk with center (222, 155) and radius 44.
; PLAN: r0=222(x), r1=155(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 155
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
