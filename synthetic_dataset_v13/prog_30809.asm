; DESCRIPTION: Draws a blue line from (416, 218) to (432, 105).
; PLAN: r0=416(x1), r1=218(y1), r2=432(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 218
LDI r2, 432
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
