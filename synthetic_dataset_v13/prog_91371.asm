; DESCRIPTION: Draws a red line from (139, 122) to (188, 59).
; PLAN: r0=139(x1), r1=122(y1), r2=188(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 122
LDI r2, 188
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
