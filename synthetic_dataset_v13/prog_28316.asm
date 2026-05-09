; DESCRIPTION: Places a purple line segment connecting (312, 87) to (353, 6).
; PLAN: r0=312(x1), r1=87(y1), r2=353(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 87
LDI r2, 353
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
