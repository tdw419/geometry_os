; DESCRIPTION: Renders a orange disk with center (160, 76) and radius 58.
; PLAN: r0=160(x), r1=76(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 76
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
