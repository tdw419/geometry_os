; DESCRIPTION: Draws a purple line from (276, 101) to (57, 140).
; PLAN: r0=276(x1), r1=101(y1), r2=57(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 101
LDI r2, 57
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
