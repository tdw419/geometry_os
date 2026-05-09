; DESCRIPTION: Draws a yellow line from (283, 147) to (68, 198).
; PLAN: r0=283(x1), r1=147(y1), r2=68(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 147
LDI r2, 68
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
