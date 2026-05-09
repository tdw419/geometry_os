; DESCRIPTION: Draws a red line from (153, 59) to (385, 90).
; PLAN: r0=153(x1), r1=59(y1), r2=385(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 59
LDI r2, 385
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
