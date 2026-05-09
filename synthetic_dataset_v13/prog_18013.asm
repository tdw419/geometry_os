; DESCRIPTION: Draws a purple line from (28, 112) to (436, 197).
; PLAN: r0=28(x1), r1=112(y1), r2=436(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 112
LDI r2, 436
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
