; DESCRIPTION: Draws a blue line from (312, 155) to (137, 160).
; PLAN: r0=312(x1), r1=155(y1), r2=137(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 155
LDI r2, 137
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
