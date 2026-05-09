; DESCRIPTION: Draws a purple line from (378, 110) to (10, 127).
; PLAN: r0=378(x1), r1=110(y1), r2=10(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 110
LDI r2, 10
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
