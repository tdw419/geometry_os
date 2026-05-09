; DESCRIPTION: Renders a orange disk with center (359, 58) and radius 24.
; PLAN: r0=359(x), r1=58(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 58
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
