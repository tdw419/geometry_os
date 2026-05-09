; DESCRIPTION: Draws a blue line from (287, 227) to (491, 94).
; PLAN: r0=287(x1), r1=227(y1), r2=491(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 227
LDI r2, 491
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
