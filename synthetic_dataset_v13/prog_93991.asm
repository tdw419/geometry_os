; DESCRIPTION: Draws a blue line from (336, 227) to (390, 37).
; PLAN: r0=336(x1), r1=227(y1), r2=390(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 227
LDI r2, 390
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
