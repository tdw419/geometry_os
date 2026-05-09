; DESCRIPTION: Places a purple line segment connecting (88, 133) to (101, 117).
; PLAN: r0=88(x1), r1=133(y1), r2=101(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 133
LDI r2, 101
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
