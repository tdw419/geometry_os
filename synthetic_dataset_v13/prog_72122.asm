; DESCRIPTION: Draws a purple line from (287, 170) to (302, 223).
; PLAN: r0=287(x1), r1=170(y1), r2=302(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 170
LDI r2, 302
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
