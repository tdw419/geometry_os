; DESCRIPTION: Draws a red line from (301, 168) to (118, 35).
; PLAN: r0=301(x1), r1=168(y1), r2=118(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 168
LDI r2, 118
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
