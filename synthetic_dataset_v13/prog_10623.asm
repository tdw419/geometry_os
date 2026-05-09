; DESCRIPTION: Places a purple line segment connecting (466, 102) to (231, 36).
; PLAN: r0=466(x1), r1=102(y1), r2=231(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 102
LDI r2, 231
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
