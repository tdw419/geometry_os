; DESCRIPTION: Draws a purple line from (278, 80) to (316, 76).
; PLAN: r0=278(x1), r1=80(y1), r2=316(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 80
LDI r2, 316
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
