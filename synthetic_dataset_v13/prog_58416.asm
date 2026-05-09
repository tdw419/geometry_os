; DESCRIPTION: Places a purple line segment connecting (56, 60) to (301, 188).
; PLAN: r0=56(x1), r1=60(y1), r2=301(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 60
LDI r2, 301
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
