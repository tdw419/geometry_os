; DESCRIPTION: Draws a red line from (473, 156) to (246, 145).
; PLAN: r0=473(x1), r1=156(y1), r2=246(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 156
LDI r2, 246
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
