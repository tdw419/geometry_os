; DESCRIPTION: Places a purple line segment connecting (381, 83) to (466, 243).
; PLAN: r0=381(x1), r1=83(y1), r2=466(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 83
LDI r2, 466
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
