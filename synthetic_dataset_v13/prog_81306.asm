; DESCRIPTION: Renders a orange disk with center (225, 119) and radius 56.
; PLAN: r0=225(x), r1=119(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 119
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
