; DESCRIPTION: Draws a yellow line from (147, 150) to (288, 110).
; PLAN: r0=147(x1), r1=150(y1), r2=288(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 150
LDI r2, 288
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
