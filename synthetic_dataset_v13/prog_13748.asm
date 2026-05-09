; DESCRIPTION: Draws a purple line from (246, 60) to (0, 223).
; PLAN: r0=246(x1), r1=60(y1), r2=0(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 60
LDI r2, 0
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
