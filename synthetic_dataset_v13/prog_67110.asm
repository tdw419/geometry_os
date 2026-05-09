; DESCRIPTION: Draws a purple line from (62, 147) to (436, 61).
; PLAN: r0=62(x1), r1=147(y1), r2=436(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 147
LDI r2, 436
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
