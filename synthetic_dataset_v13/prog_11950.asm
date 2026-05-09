; DESCRIPTION: Draws a red line from (316, 110) to (106, 9).
; PLAN: r0=316(x1), r1=110(y1), r2=106(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 110
LDI r2, 106
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
