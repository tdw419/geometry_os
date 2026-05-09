; DESCRIPTION: Draws a red line from (301, 115) to (241, 163).
; PLAN: r0=301(x1), r1=115(y1), r2=241(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 115
LDI r2, 241
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
