; DESCRIPTION: Draws a purple line from (323, 221) to (101, 118).
; PLAN: r0=323(x1), r1=221(y1), r2=101(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 221
LDI r2, 101
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
