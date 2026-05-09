; DESCRIPTION: Draws a purple line from (125, 123) to (287, 251).
; PLAN: r0=125(x1), r1=123(y1), r2=287(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 123
LDI r2, 287
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
