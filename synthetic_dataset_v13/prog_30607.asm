; DESCRIPTION: Draws a blue line from (147, 110) to (203, 39).
; PLAN: r0=147(x1), r1=110(y1), r2=203(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 110
LDI r2, 203
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
