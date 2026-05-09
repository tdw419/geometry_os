; DESCRIPTION: Draws a purple line from (107, 3) to (490, 34).
; PLAN: r0=107(x1), r1=3(y1), r2=490(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 3
LDI r2, 490
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
