; DESCRIPTION: Draws a purple line from (285, 57) to (489, 233).
; PLAN: r0=285(x1), r1=57(y1), r2=489(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 57
LDI r2, 489
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
