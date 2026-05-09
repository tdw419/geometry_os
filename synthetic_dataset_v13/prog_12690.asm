; DESCRIPTION: Renders a orange disk with center (368, 40) and radius 33.
; PLAN: r0=368(x), r1=40(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 40
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
