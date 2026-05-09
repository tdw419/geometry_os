; DESCRIPTION: Draws a purple line from (16, 198) to (486, 52).
; PLAN: r0=16(x1), r1=198(y1), r2=486(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 198
LDI r2, 486
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
