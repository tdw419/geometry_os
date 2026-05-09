; DESCRIPTION: Draws a red line from (497, 156) to (486, 58).
; PLAN: r0=497(x1), r1=156(y1), r2=486(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 156
LDI r2, 486
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
