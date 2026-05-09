; DESCRIPTION: Draws a purple line from (236, 145) to (328, 137).
; PLAN: r0=236(x1), r1=145(y1), r2=328(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 145
LDI r2, 328
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
