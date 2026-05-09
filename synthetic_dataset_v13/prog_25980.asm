; DESCRIPTION: Draws a purple line from (57, 100) to (432, 110).
; PLAN: r0=57(x1), r1=100(y1), r2=432(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 100
LDI r2, 432
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
