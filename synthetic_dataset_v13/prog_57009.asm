; DESCRIPTION: Places a purple line segment connecting (90, 89) to (259, 207).
; PLAN: r0=90(x1), r1=89(y1), r2=259(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 89
LDI r2, 259
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
