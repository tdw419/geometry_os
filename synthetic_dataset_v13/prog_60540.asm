; DESCRIPTION: Draws a purple line from (269, 147) to (31, 133).
; PLAN: r0=269(x1), r1=147(y1), r2=31(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 147
LDI r2, 31
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
