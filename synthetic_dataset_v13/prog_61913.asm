; DESCRIPTION: Places a purple line segment connecting (489, 122) to (316, 209).
; PLAN: r0=489(x1), r1=122(y1), r2=316(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 122
LDI r2, 316
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
