; DESCRIPTION: Draws a purple line from (325, 169) to (169, 87).
; PLAN: r0=325(x1), r1=169(y1), r2=169(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 169
LDI r2, 169
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
