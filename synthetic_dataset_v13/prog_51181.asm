; DESCRIPTION: Renders a cyan disk with center (192, 170) and radius 38.
; PLAN: r0=192(x), r1=170(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 170
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
