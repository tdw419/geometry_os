; DESCRIPTION: Places a purple line segment connecting (6, 53) to (158, 87).
; PLAN: r0=6(x1), r1=53(y1), r2=158(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 53
LDI r2, 158
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
