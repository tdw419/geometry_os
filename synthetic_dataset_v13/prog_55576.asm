; DESCRIPTION: Renders a cyan disk with center (81, 170) and radius 39.
; PLAN: r0=81(x), r1=170(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 170
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
