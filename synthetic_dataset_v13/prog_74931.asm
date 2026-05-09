; DESCRIPTION: Draws a orange line from (435, 147) to (276, 167).
; PLAN: r0=435(x1), r1=147(y1), r2=276(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 147
LDI r2, 276
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
