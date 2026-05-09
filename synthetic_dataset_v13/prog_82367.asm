; DESCRIPTION: Places a purple line segment connecting (301, 162) to (314, 162).
; PLAN: r0=301(x1), r1=162(y1), r2=314(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 162
LDI r2, 314
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
