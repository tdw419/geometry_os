; DESCRIPTION: Draws a purple line from (105, 118) to (99, 92).
; PLAN: r0=105(x1), r1=118(y1), r2=99(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 118
LDI r2, 99
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
