; DESCRIPTION: Draws a blue line from (176, 147) to (266, 248).
; PLAN: r0=176(x1), r1=147(y1), r2=266(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 147
LDI r2, 266
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
