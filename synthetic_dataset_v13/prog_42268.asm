; DESCRIPTION: Draws a purple line from (88, 251) to (419, 153).
; PLAN: r0=88(x1), r1=251(y1), r2=419(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 251
LDI r2, 419
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
