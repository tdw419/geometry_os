; DESCRIPTION: Renders a cyan disk with center (158, 192) and radius 25.
; PLAN: r0=158(x), r1=192(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 192
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
