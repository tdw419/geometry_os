; DESCRIPTION: Places a purple line segment connecting (118, 103) to (74, 145).
; PLAN: r0=118(x1), r1=103(y1), r2=74(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 103
LDI r2, 74
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
