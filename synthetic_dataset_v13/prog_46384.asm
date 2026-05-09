; DESCRIPTION: Places a purple line segment connecting (169, 147) to (89, 207).
; PLAN: r0=169(x1), r1=147(y1), r2=89(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 147
LDI r2, 89
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
