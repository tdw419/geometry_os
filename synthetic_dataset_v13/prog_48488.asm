; DESCRIPTION: Draws a purple line from (47, 226) to (7, 25).
; PLAN: r0=47(x1), r1=226(y1), r2=7(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 226
LDI r2, 7
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
