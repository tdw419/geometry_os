; DESCRIPTION: Renders a orange disk with center (188, 89) and radius 25.
; PLAN: r0=188(x), r1=89(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 89
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
