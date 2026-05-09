; DESCRIPTION: Places a purple line segment connecting (476, 80) to (74, 66).
; PLAN: r0=476(x1), r1=80(y1), r2=74(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 80
LDI r2, 74
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
