; DESCRIPTION: Draws a purple line from (26, 81) to (448, 66).
; PLAN: r0=26(x1), r1=81(y1), r2=448(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 81
LDI r2, 448
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
