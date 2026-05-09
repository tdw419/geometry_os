; DESCRIPTION: Draws a red line from (123, 148) to (147, 224).
; PLAN: r0=123(x1), r1=148(y1), r2=147(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 148
LDI r2, 147
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
