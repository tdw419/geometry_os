; DESCRIPTION: Draws a purple line from (22, 118) to (199, 153).
; PLAN: r0=22(x1), r1=118(y1), r2=199(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 118
LDI r2, 199
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
