; DESCRIPTION: Places a purple line segment connecting (220, 179) to (72, 110).
; PLAN: r0=220(x1), r1=179(y1), r2=72(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 179
LDI r2, 72
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
