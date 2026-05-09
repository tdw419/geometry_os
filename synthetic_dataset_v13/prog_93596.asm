; DESCRIPTION: Places a purple line segment connecting (57, 142) to (158, 68).
; PLAN: r0=57(x1), r1=142(y1), r2=158(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 142
LDI r2, 158
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
