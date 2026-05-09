; DESCRIPTION: Places a purple line segment connecting (406, 70) to (97, 8).
; PLAN: r0=406(x1), r1=70(y1), r2=97(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 70
LDI r2, 97
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
