; DESCRIPTION: Places a purple line segment connecting (344, 89) to (149, 6).
; PLAN: r0=344(x1), r1=89(y1), r2=149(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 89
LDI r2, 149
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
