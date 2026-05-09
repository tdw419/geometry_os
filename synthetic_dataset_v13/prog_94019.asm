; DESCRIPTION: Places a purple line segment connecting (323, 95) to (185, 7).
; PLAN: r0=323(x1), r1=95(y1), r2=185(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 95
LDI r2, 185
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
