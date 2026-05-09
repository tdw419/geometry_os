; DESCRIPTION: Places a purple line segment connecting (466, 213) to (432, 158).
; PLAN: r0=466(x1), r1=213(y1), r2=432(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 213
LDI r2, 432
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
