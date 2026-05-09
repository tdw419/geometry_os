; DESCRIPTION: Draws a red line from (116, 182) to (287, 178).
; PLAN: r0=116(x1), r1=182(y1), r2=287(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 182
LDI r2, 287
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
