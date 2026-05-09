; DESCRIPTION: Renders a green disk with center (394, 170) and radius 36.
; PLAN: r0=394(x), r1=170(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 170
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
