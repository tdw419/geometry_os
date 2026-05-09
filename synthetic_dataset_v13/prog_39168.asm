; DESCRIPTION: Draws a purple line from (381, 9) to (337, 190).
; PLAN: r0=381(x1), r1=9(y1), r2=337(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 9
LDI r2, 337
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
