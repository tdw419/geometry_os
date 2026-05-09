; DESCRIPTION: Places a purple line segment connecting (316, 255) to (133, 3).
; PLAN: r0=316(x1), r1=255(y1), r2=133(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 255
LDI r2, 133
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
