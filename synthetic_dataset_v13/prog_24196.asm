; DESCRIPTION: Draws a purple line from (188, 160) to (322, 35).
; PLAN: r0=188(x1), r1=160(y1), r2=322(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 160
LDI r2, 322
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
