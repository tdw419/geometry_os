; DESCRIPTION: Draws a blue line from (97, 160) to (500, 169).
; PLAN: r0=97(x1), r1=160(y1), r2=500(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 160
LDI r2, 500
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
