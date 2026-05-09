; DESCRIPTION: Draws a purple line from (425, 89) to (158, 13).
; PLAN: r0=425(x1), r1=89(y1), r2=158(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 89
LDI r2, 158
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
