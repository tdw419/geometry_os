; DESCRIPTION: Renders a green disk with center (188, 98) and radius 75.
; PLAN: r0=188(x), r1=98(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 98
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
