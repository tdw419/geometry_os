; DESCRIPTION: Draws a red line from (222, 210) to (369, 118).
; PLAN: r0=222(x1), r1=210(y1), r2=369(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 210
LDI r2, 369
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
