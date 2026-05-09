; DESCRIPTION: Draws a purple line from (157, 57) to (194, 218).
; PLAN: r0=157(x1), r1=57(y1), r2=194(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 57
LDI r2, 194
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
