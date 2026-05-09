; DESCRIPTION: Draws a purple line from (172, 175) to (451, 246).
; PLAN: r0=172(x1), r1=175(y1), r2=451(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 175
LDI r2, 451
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
