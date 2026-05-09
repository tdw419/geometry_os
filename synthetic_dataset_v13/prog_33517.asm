; DESCRIPTION: Places a purple line segment connecting (118, 60) to (226, 251).
; PLAN: r0=118(x1), r1=60(y1), r2=226(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 60
LDI r2, 226
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
