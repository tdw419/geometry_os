; DESCRIPTION: Draws a purple line from (377, 232) to (355, 254).
; PLAN: r0=377(x1), r1=232(y1), r2=355(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 232
LDI r2, 355
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
