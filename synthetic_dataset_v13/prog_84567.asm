; DESCRIPTION: Places a purple line segment connecting (290, 155) to (158, 162).
; PLAN: r0=290(x1), r1=155(y1), r2=158(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 155
LDI r2, 158
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
