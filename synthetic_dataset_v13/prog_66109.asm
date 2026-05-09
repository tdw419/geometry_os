; DESCRIPTION: Draws a purple line from (15, 179) to (109, 1).
; PLAN: r0=15(x1), r1=179(y1), r2=109(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 179
LDI r2, 109
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
