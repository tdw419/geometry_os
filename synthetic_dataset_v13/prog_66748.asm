; DESCRIPTION: Draws a red line from (369, 92) to (495, 84).
; PLAN: r0=369(x1), r1=92(y1), r2=495(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 92
LDI r2, 495
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
