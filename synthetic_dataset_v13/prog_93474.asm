; DESCRIPTION: Draws a purple line from (369, 149) to (233, 143).
; PLAN: r0=369(x1), r1=149(y1), r2=233(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 149
LDI r2, 233
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
