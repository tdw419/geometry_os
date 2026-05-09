; DESCRIPTION: Renders a orange disk with center (323, 145) and radius 60.
; PLAN: r0=323(x), r1=145(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 145
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
