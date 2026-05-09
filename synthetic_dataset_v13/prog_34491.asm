; DESCRIPTION: Draws a purple line from (147, 254) to (358, 63).
; PLAN: r0=147(x1), r1=254(y1), r2=358(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 254
LDI r2, 358
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
