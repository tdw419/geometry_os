; DESCRIPTION: Renders a orange disk with center (393, 158) and radius 65.
; PLAN: r0=393(x), r1=158(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 158
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
