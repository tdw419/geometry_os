; DESCRIPTION: Renders a green disk with center (132, 137) and radius 71.
; PLAN: r0=132(x), r1=137(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 137
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
