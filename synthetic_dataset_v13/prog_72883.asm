; DESCRIPTION: Draws a red line from (369, 116) to (44, 92).
; PLAN: r0=369(x1), r1=116(y1), r2=44(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 116
LDI r2, 44
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
