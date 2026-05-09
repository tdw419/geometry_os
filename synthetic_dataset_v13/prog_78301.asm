; DESCRIPTION: Draws a purple line from (427, 243) to (135, 118).
; PLAN: r0=427(x1), r1=243(y1), r2=135(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 243
LDI r2, 135
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
