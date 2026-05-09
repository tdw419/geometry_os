; DESCRIPTION: Draws a purple line from (334, 169) to (369, 47).
; PLAN: r0=334(x1), r1=169(y1), r2=369(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 169
LDI r2, 369
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
