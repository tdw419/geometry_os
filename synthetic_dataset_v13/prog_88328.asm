; DESCRIPTION: Draws a yellow line from (130, 35) to (424, 147).
; PLAN: r0=130(x1), r1=35(y1), r2=424(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 35
LDI r2, 424
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
