; DESCRIPTION: Draws a purple line from (471, 90) to (436, 136).
; PLAN: r0=471(x1), r1=90(y1), r2=436(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 90
LDI r2, 436
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
