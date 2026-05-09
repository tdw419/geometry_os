; DESCRIPTION: Places a purple line segment connecting (251, 158) to (352, 85).
; PLAN: r0=251(x1), r1=158(y1), r2=352(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 158
LDI r2, 352
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
