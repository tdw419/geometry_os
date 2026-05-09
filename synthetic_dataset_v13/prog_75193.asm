; DESCRIPTION: Draws a orange line from (147, 28) to (120, 186).
; PLAN: r0=147(x1), r1=28(y1), r2=120(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 28
LDI r2, 120
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
