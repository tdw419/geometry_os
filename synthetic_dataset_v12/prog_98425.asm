; DESCRIPTION: Places a purple line segment connecting (331, 77) to (40, 84).
; PLAN: r0=331(x1), r1=77(y1), r2=40(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 77
LDI r2, 40
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
