; DESCRIPTION: Draws a red line from (118, 172) to (351, 95).
; PLAN: r0=118(x1), r1=172(y1), r2=351(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 172
LDI r2, 351
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
