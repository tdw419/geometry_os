; DESCRIPTION: Renders a green disk with center (228, 170) and radius 31.
; PLAN: r0=228(x), r1=170(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 170
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
