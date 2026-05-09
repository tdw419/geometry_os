; DESCRIPTION: Draws a purple line from (97, 56) to (486, 221).
; PLAN: r0=97(x1), r1=56(y1), r2=486(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 56
LDI r2, 486
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
