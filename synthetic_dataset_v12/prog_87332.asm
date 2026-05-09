; DESCRIPTION: Draws a red line from (374, 136) to (147, 143).
; PLAN: r0=374(x1), r1=136(y1), r2=147(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 136
LDI r2, 147
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
