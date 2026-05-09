; DESCRIPTION: Renders a green disk with center (345, 170) and radius 24.
; PLAN: r0=345(x), r1=170(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 170
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
