; DESCRIPTION: Draws a red line from (369, 255) to (15, 15).
; PLAN: r0=369(x1), r1=255(y1), r2=15(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 255
LDI r2, 15
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
