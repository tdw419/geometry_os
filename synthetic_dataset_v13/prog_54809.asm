; DESCRIPTION: Draws a purple line from (277, 212) to (34, 140).
; PLAN: r0=277(x1), r1=212(y1), r2=34(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 212
LDI r2, 34
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
