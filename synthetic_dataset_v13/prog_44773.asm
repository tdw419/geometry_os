; DESCRIPTION: Renders a orange disk with center (359, 225) and radius 15.
; PLAN: r0=359(x), r1=225(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 225
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
