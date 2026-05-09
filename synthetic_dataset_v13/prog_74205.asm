; DESCRIPTION: Places a purple line segment connecting (315, 90) to (227, 82).
; PLAN: r0=315(x1), r1=90(y1), r2=227(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 90
LDI r2, 227
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
