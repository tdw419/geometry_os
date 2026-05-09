; DESCRIPTION: Draws a purple line from (84, 198) to (238, 181).
; PLAN: r0=84(x1), r1=198(y1), r2=238(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 198
LDI r2, 238
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
