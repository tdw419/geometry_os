; DESCRIPTION: Draws a red line from (69, 197) to (211, 147).
; PLAN: r0=69(x1), r1=197(y1), r2=211(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 197
LDI r2, 211
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
