; DESCRIPTION: Places a purple line segment connecting (37, 59) to (84, 158).
; PLAN: r0=37(x1), r1=59(y1), r2=84(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 59
LDI r2, 84
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
