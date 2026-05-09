; DESCRIPTION: Draws a purple line from (23, 110) to (44, 95).
; PLAN: r0=23(x1), r1=110(y1), r2=44(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 110
LDI r2, 44
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
