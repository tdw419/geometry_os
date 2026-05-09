; DESCRIPTION: Draws a purple line from (389, 102) to (163, 76).
; PLAN: r0=389(x1), r1=102(y1), r2=163(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 102
LDI r2, 163
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
