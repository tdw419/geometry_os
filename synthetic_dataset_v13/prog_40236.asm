; DESCRIPTION: Draws a purple line from (144, 237) to (56, 147).
; PLAN: r0=144(x1), r1=237(y1), r2=56(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 237
LDI r2, 56
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
