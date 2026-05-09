; DESCRIPTION: Draws a purple line from (506, 175) to (374, 185).
; PLAN: r0=506(x1), r1=175(y1), r2=374(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 175
LDI r2, 374
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
