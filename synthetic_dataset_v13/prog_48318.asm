; DESCRIPTION: Draws a purple line from (359, 169) to (308, 200).
; PLAN: r0=359(x1), r1=169(y1), r2=308(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 169
LDI r2, 308
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
