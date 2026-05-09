; DESCRIPTION: Places a purple line segment connecting (147, 169) to (453, 186).
; PLAN: r0=147(x1), r1=169(y1), r2=453(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 169
LDI r2, 453
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
