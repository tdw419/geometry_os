; DESCRIPTION: Renders a green disk with center (133, 208) and radius 44.
; PLAN: r0=133(x), r1=208(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 208
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
