; DESCRIPTION: Draws a blue line from (26, 169) to (213, 145).
; PLAN: r0=26(x1), r1=169(y1), r2=213(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 169
LDI r2, 213
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
