; DESCRIPTION: Renders a green disk with center (136, 90) and radius 75.
; PLAN: r0=136(x), r1=90(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 90
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
