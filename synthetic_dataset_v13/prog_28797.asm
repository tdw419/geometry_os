; DESCRIPTION: Draws a purple line from (110, 142) to (100, 56).
; PLAN: r0=110(x1), r1=142(y1), r2=100(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 142
LDI r2, 100
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
