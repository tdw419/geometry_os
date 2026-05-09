; DESCRIPTION: Draws a red line from (426, 247) to (427, 232).
; PLAN: r0=426(x1), r1=247(y1), r2=427(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 247
LDI r2, 427
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
