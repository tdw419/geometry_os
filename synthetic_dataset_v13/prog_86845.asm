; DESCRIPTION: Draws a purple line from (370, 147) to (448, 107).
; PLAN: r0=370(x1), r1=147(y1), r2=448(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 147
LDI r2, 448
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
