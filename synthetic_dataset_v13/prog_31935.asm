; DESCRIPTION: Draws a red line from (273, 118) to (62, 243).
; PLAN: r0=273(x1), r1=118(y1), r2=62(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 118
LDI r2, 62
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
