; DESCRIPTION: Draws a red line from (179, 51) to (316, 186).
; PLAN: r0=179(x1), r1=51(y1), r2=316(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 51
LDI r2, 316
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
