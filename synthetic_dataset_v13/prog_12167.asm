; DESCRIPTION: Places a purple line segment connecting (339, 61) to (312, 29).
; PLAN: r0=339(x1), r1=61(y1), r2=312(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 61
LDI r2, 312
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
