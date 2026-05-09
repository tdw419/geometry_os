; DESCRIPTION: Draws a purple line from (244, 88) to (389, 147).
; PLAN: r0=244(x1), r1=88(y1), r2=389(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 88
LDI r2, 389
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
