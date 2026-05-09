; DESCRIPTION: Draws a red line from (25, 136) to (346, 147).
; PLAN: r0=25(x1), r1=136(y1), r2=346(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 136
LDI r2, 346
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
