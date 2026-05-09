; DESCRIPTION: Draws a purple line from (415, 158) to (337, 58).
; PLAN: r0=415(x1), r1=158(y1), r2=337(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 158
LDI r2, 337
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
