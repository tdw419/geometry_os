; DESCRIPTION: Draws a purple line from (261, 147) to (219, 196).
; PLAN: r0=261(x1), r1=147(y1), r2=219(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 147
LDI r2, 219
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
