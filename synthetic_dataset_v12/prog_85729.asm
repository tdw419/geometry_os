; DESCRIPTION: Draws a purple line from (101, 14) to (204, 190).
; PLAN: r0=101(x1), r1=14(y1), r2=204(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 14
LDI r2, 204
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
