; DESCRIPTION: Draws a red line from (258, 184) to (147, 17).
; PLAN: r0=258(x1), r1=184(y1), r2=147(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 184
LDI r2, 147
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
