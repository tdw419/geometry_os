; DESCRIPTION: Draws a blue line from (390, 169) to (412, 175).
; PLAN: r0=390(x1), r1=169(y1), r2=412(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 169
LDI r2, 412
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
