; DESCRIPTION: Renders a orange disk with center (280, 136) and radius 40.
; PLAN: r0=280(x), r1=136(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 136
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
