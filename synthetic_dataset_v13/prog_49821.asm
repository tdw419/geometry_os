; DESCRIPTION: Draws a blue line from (312, 4) to (455, 147).
; PLAN: r0=312(x1), r1=4(y1), r2=455(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 4
LDI r2, 455
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
