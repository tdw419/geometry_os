; DESCRIPTION: Places a purple line segment connecting (316, 132) to (423, 168).
; PLAN: r0=316(x1), r1=132(y1), r2=423(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 132
LDI r2, 423
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
