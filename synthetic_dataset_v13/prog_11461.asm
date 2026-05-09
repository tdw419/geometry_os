; DESCRIPTION: Draws a purple line from (86, 14) to (6, 110).
; PLAN: r0=86(x1), r1=14(y1), r2=6(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 14
LDI r2, 6
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
