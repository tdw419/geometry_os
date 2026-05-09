; DESCRIPTION: Draws a purple line from (226, 50) to (484, 70).
; PLAN: r0=226(x1), r1=50(y1), r2=484(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 50
LDI r2, 484
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
