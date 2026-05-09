; DESCRIPTION: Draws a purple line from (426, 147) to (389, 162).
; PLAN: r0=426(x1), r1=147(y1), r2=389(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 147
LDI r2, 389
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
