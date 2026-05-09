; DESCRIPTION: Draws a purple line from (236, 20) to (233, 97).
; PLAN: r0=236(x1), r1=20(y1), r2=233(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 20
LDI r2, 233
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
