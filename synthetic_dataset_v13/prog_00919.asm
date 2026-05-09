; DESCRIPTION: Draws a purple line from (457, 95) to (389, 244).
; PLAN: r0=457(x1), r1=95(y1), r2=389(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 95
LDI r2, 389
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
