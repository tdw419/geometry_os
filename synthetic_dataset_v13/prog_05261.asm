; DESCRIPTION: Draws a purple line from (420, 57) to (246, 62).
; PLAN: r0=420(x1), r1=57(y1), r2=246(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 57
LDI r2, 246
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
