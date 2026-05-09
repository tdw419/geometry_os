; DESCRIPTION: Draws a purple line from (278, 38) to (316, 145).
; PLAN: r0=278(x1), r1=38(y1), r2=316(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 38
LDI r2, 316
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
