; DESCRIPTION: Places a blue line segment connecting (484, 190) to (428, 135).
; PLAN: r0=484(x1), r1=190(y1), r2=428(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 190
LDI r2, 428
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
