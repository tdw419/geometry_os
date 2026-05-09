; DESCRIPTION: Draws a red line from (374, 246) to (297, 141).
; PLAN: r0=374(x1), r1=246(y1), r2=297(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 246
LDI r2, 297
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
