; DESCRIPTION: Draws a purple line from (54, 183) to (339, 10).
; PLAN: r0=54(x1), r1=183(y1), r2=339(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 183
LDI r2, 339
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
