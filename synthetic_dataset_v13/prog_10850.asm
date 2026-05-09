; DESCRIPTION: Draws a blue line from (98, 158) to (287, 105).
; PLAN: r0=98(x1), r1=158(y1), r2=287(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 158
LDI r2, 287
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
