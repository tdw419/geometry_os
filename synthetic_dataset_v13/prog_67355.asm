; DESCRIPTION: Draws a red line from (185, 147) to (497, 61).
; PLAN: r0=185(x1), r1=147(y1), r2=497(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 147
LDI r2, 497
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
