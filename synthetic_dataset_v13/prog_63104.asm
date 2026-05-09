; DESCRIPTION: Draws a purple line from (339, 142) to (139, 206).
; PLAN: r0=339(x1), r1=142(y1), r2=139(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 142
LDI r2, 139
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
