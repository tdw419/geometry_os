; DESCRIPTION: Draws a blue line from (169, 33) to (351, 26).
; PLAN: r0=169(x1), r1=33(y1), r2=351(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 33
LDI r2, 351
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
