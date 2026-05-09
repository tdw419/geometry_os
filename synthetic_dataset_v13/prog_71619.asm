; DESCRIPTION: Draws a yellow line from (505, 65) to (4, 147).
; PLAN: r0=505(x1), r1=65(y1), r2=4(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 65
LDI r2, 4
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
