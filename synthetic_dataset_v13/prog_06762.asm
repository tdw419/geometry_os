; DESCRIPTION: Renders a orange disk with center (442, 75) and radius 58.
; PLAN: r0=442(x), r1=75(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 75
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
