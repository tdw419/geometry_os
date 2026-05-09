; DESCRIPTION: Draws a purple line from (406, 133) to (37, 22).
; PLAN: r0=406(x1), r1=133(y1), r2=37(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 133
LDI r2, 37
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
