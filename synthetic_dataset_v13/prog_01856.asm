; DESCRIPTION: Renders a orange disk with center (392, 170) and radius 49.
; PLAN: r0=392(x), r1=170(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 170
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
