; DESCRIPTION: Draws a yellow line from (67, 147) to (269, 185).
; PLAN: r0=67(x1), r1=147(y1), r2=269(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 147
LDI r2, 269
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
