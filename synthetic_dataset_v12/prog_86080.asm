; DESCRIPTION: Draws a purple line from (373, 246) to (169, 243).
; PLAN: r0=373(x1), r1=246(y1), r2=169(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 246
LDI r2, 169
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
