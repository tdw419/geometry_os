; DESCRIPTION: Draws a yellow line from (291, 76) to (147, 75).
; PLAN: r0=291(x1), r1=76(y1), r2=147(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 76
LDI r2, 147
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
