; DESCRIPTION: Draws a purple line from (227, 83) to (106, 62).
; PLAN: r0=227(x1), r1=83(y1), r2=106(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 83
LDI r2, 106
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
