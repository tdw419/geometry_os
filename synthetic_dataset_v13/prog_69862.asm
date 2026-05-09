; DESCRIPTION: Renders a cyan disk with center (390, 99) and radius 12.
; PLAN: r0=390(x), r1=99(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 99
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
