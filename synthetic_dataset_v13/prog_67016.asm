; DESCRIPTION: Places a purple line segment connecting (73, 218) to (306, 37).
; PLAN: r0=73(x1), r1=218(y1), r2=306(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 218
LDI r2, 306
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
