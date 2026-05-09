; DESCRIPTION: Places a purple line segment connecting (378, 50) to (142, 167).
; PLAN: r0=378(x1), r1=50(y1), r2=142(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 50
LDI r2, 142
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
