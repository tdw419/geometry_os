; DESCRIPTION: Renders a green disk with center (169, 106) and radius 71.
; PLAN: r0=169(x), r1=106(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 106
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
