; DESCRIPTION: Draws a green line from (102, 169) to (132, 145).
; PLAN: r0=102(x1), r1=169(y1), r2=132(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 169
LDI r2, 132
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
