; DESCRIPTION: Draws a red line from (315, 210) to (301, 121).
; PLAN: r0=315(x1), r1=210(y1), r2=301(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 210
LDI r2, 301
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
