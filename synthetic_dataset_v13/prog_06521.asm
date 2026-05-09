; DESCRIPTION: Draws a purple line from (407, 89) to (408, 162).
; PLAN: r0=407(x1), r1=89(y1), r2=408(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 89
LDI r2, 408
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
