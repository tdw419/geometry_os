; DESCRIPTION: Draws a red line from (361, 169) to (343, 118).
; PLAN: r0=361(x1), r1=169(y1), r2=343(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 169
LDI r2, 343
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
