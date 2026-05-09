; DESCRIPTION: Places a purple line segment connecting (31, 218) to (306, 79).
; PLAN: r0=31(x1), r1=218(y1), r2=306(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 218
LDI r2, 306
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
