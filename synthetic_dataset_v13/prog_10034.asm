; DESCRIPTION: Draws a green line from (202, 156) to (451, 252).
; PLAN: r0=202(x1), r1=156(y1), r2=451(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 156
LDI r2, 451
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
