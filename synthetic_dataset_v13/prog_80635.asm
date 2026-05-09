; DESCRIPTION: Draws a purple line from (201, 240) to (489, 22).
; PLAN: r0=201(x1), r1=240(y1), r2=489(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 240
LDI r2, 489
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
