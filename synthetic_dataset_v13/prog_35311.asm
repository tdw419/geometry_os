; DESCRIPTION: Places a purple line segment connecting (411, 4) to (11, 218).
; PLAN: r0=411(x1), r1=4(y1), r2=11(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 4
LDI r2, 11
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
