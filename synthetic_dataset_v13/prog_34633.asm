; DESCRIPTION: Draws a purple line from (166, 118) to (181, 19).
; PLAN: r0=166(x1), r1=118(y1), r2=181(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 118
LDI r2, 181
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
