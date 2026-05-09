; DESCRIPTION: Places a purple line segment connecting (390, 109) to (158, 113).
; PLAN: r0=390(x1), r1=109(y1), r2=158(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 109
LDI r2, 158
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
