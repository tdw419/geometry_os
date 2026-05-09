; DESCRIPTION: Draws a purple line from (195, 84) to (314, 11).
; PLAN: r0=195(x1), r1=84(y1), r2=314(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 84
LDI r2, 314
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
