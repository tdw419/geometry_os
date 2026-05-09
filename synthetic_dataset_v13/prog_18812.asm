; DESCRIPTION: Draws a purple line from (149, 200) to (280, 211).
; PLAN: r0=149(x1), r1=200(y1), r2=280(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 200
LDI r2, 280
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
