; DESCRIPTION: Places a purple line segment connecting (229, 137) to (204, 203).
; PLAN: r0=229(x1), r1=137(y1), r2=204(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 137
LDI r2, 204
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
