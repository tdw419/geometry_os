; DESCRIPTION: Draws a purple line from (117, 112) to (339, 25).
; PLAN: r0=117(x1), r1=112(y1), r2=339(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 112
LDI r2, 339
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
