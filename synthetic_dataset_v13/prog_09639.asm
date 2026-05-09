; DESCRIPTION: Draws a purple line from (73, 246) to (71, 157).
; PLAN: r0=73(x1), r1=246(y1), r2=71(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 246
LDI r2, 71
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
