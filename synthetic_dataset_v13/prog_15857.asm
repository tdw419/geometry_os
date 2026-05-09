; DESCRIPTION: Places a purple line segment connecting (366, 46) to (280, 61).
; PLAN: r0=366(x1), r1=46(y1), r2=280(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 46
LDI r2, 280
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
