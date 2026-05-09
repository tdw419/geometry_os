; DESCRIPTION: Places a yellow line segment connecting (176, 9) to (133, 147).
; PLAN: r0=176(x1), r1=9(y1), r2=133(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 9
LDI r2, 133
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
