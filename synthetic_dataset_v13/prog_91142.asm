; DESCRIPTION: Draws a red line from (183, 20) to (20, 147).
; PLAN: r0=183(x1), r1=20(y1), r2=20(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 20
LDI r2, 20
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
