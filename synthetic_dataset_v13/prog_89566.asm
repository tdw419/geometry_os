; DESCRIPTION: Renders a orange disk with center (347, 40) and radius 26.
; PLAN: r0=347(x), r1=40(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 40
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
