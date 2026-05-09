; DESCRIPTION: Draws a red line from (265, 38) to (351, 118).
; PLAN: r0=265(x1), r1=38(y1), r2=351(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 38
LDI r2, 351
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
