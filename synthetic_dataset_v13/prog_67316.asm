; DESCRIPTION: Draws a purple line from (185, 199) to (149, 62).
; PLAN: r0=185(x1), r1=199(y1), r2=149(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 199
LDI r2, 149
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
