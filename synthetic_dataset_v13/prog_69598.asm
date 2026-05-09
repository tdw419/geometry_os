; DESCRIPTION: Renders a yellow line between points (155, 12) and (351, 129).
; PLAN: r0=155(x1), r1=12(y1), r2=351(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 12
LDI r2, 351
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
