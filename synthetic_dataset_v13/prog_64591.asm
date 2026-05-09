; DESCRIPTION: Draws a purple line from (452, 78) to (17, 185).
; PLAN: r0=452(x1), r1=78(y1), r2=17(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 78
LDI r2, 17
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
