; DESCRIPTION: Draws a yellow line from (136, 187) to (212, 252).
; PLAN: r0=136(x1), r1=187(y1), r2=212(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 187
LDI r2, 212
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
