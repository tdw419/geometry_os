; DESCRIPTION: Draws a purple line from (17, 198) to (381, 23).
; PLAN: r0=17(x1), r1=198(y1), r2=381(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 198
LDI r2, 381
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
