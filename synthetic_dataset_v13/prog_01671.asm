; DESCRIPTION: Draws a purple line from (58, 190) to (430, 143).
; PLAN: r0=58(x1), r1=190(y1), r2=430(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 190
LDI r2, 430
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
