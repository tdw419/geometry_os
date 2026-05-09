; DESCRIPTION: Renders a green disk with center (172, 81) and radius 22.
; PLAN: r0=172(x), r1=81(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 81
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
