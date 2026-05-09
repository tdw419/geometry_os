; DESCRIPTION: Places a purple line segment connecting (169, 137) to (107, 183).
; PLAN: r0=169(x1), r1=137(y1), r2=107(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 137
LDI r2, 107
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
