; DESCRIPTION: Renders a green disk with center (169, 100) and radius 34.
; PLAN: r0=169(x), r1=100(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 100
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
