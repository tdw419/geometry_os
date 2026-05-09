; DESCRIPTION: Draws a purple line from (14, 198) to (456, 98).
; PLAN: r0=14(x1), r1=198(y1), r2=456(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 198
LDI r2, 456
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
