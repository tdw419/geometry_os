; DESCRIPTION: Renders a green disk with center (136, 99) and radius 56.
; PLAN: r0=136(x), r1=99(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 99
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
