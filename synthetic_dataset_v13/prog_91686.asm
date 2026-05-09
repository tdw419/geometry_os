; DESCRIPTION: Draws a purple line from (448, 145) to (384, 202).
; PLAN: r0=448(x1), r1=145(y1), r2=384(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 145
LDI r2, 384
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
