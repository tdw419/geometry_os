; DESCRIPTION: Draws a red line from (147, 241) to (190, 163).
; PLAN: r0=147(x1), r1=241(y1), r2=190(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 241
LDI r2, 190
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
