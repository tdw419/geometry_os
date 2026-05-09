; DESCRIPTION: Draws a blue line from (453, 227) to (181, 181).
; PLAN: r0=453(x1), r1=227(y1), r2=181(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 227
LDI r2, 181
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
