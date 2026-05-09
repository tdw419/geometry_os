; DESCRIPTION: Draws a purple line from (369, 47) to (388, 176).
; PLAN: r0=369(x1), r1=47(y1), r2=388(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 47
LDI r2, 388
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
