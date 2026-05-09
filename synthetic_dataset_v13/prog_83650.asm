; DESCRIPTION: Draws a purple line from (39, 110) to (192, 218).
; PLAN: r0=39(x1), r1=110(y1), r2=192(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 110
LDI r2, 192
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
