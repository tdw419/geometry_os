; DESCRIPTION: Draws a purple line from (369, 202) to (486, 37).
; PLAN: r0=369(x1), r1=202(y1), r2=486(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 202
LDI r2, 486
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
