; DESCRIPTION: Draws a purple line from (323, 162) to (169, 99).
; PLAN: r0=323(x1), r1=162(y1), r2=169(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 162
LDI r2, 169
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
