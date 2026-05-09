; DESCRIPTION: Draws a red line from (112, 143) to (137, 102).
; PLAN: r0=112(x1), r1=143(y1), r2=137(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 143
LDI r2, 137
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
