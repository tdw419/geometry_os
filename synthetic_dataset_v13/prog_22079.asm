; DESCRIPTION: Draws a purple line from (208, 167) to (323, 153).
; PLAN: r0=208(x1), r1=167(y1), r2=323(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 167
LDI r2, 323
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
