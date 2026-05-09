; DESCRIPTION: Draws a purple line from (10, 80) to (230, 147).
; PLAN: r0=10(x1), r1=80(y1), r2=230(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 80
LDI r2, 230
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
