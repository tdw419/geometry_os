; DESCRIPTION: Draws a yellow line from (114, 78) to (147, 102).
; PLAN: r0=114(x1), r1=78(y1), r2=147(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 78
LDI r2, 147
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
