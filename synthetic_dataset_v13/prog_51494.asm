; DESCRIPTION: Renders a blue line between points (351, 147) and (260, 136).
; PLAN: r0=351(x1), r1=147(y1), r2=260(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 147
LDI r2, 260
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
