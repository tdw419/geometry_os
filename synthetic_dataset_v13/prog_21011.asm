; DESCRIPTION: Renders a orange disk with center (323, 170) and radius 14.
; PLAN: r0=323(x), r1=170(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 170
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
