; DESCRIPTION: Draws a purple line from (302, 201) to (411, 76).
; PLAN: r0=302(x1), r1=201(y1), r2=411(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 201
LDI r2, 411
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
