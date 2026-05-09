; DESCRIPTION: Draws a purple line from (314, 133) to (44, 193).
; PLAN: r0=314(x1), r1=133(y1), r2=44(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 133
LDI r2, 44
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
