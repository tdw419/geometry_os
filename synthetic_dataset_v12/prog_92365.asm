; DESCRIPTION: Draws a red line from (163, 182) to (4, 62).
; PLAN: r0=163(x1), r1=182(y1), r2=4(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 182
LDI r2, 4
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
