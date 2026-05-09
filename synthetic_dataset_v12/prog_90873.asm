; DESCRIPTION: Draws a purple line from (162, 198) to (484, 48).
; PLAN: r0=162(x1), r1=198(y1), r2=484(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 198
LDI r2, 484
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
