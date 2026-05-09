; DESCRIPTION: Draws a purple line from (101, 185) to (238, 137).
; PLAN: r0=101(x1), r1=185(y1), r2=238(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 185
LDI r2, 238
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
