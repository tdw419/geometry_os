; DESCRIPTION: Draws a purple line from (484, 229) to (489, 57).
; PLAN: r0=484(x1), r1=229(y1), r2=489(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 229
LDI r2, 489
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
