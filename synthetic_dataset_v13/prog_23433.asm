; DESCRIPTION: Renders a orange disk with center (295, 170) and radius 31.
; PLAN: r0=295(x), r1=170(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 170
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
