; DESCRIPTION: Renders a green disk with center (252, 89) and radius 10.
; PLAN: r0=252(x), r1=89(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 89
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
