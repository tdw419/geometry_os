; DESCRIPTION: Draws a orange line from (236, 92) to (276, 232).
; PLAN: r0=236(x1), r1=92(y1), r2=276(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 92
LDI r2, 276
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
