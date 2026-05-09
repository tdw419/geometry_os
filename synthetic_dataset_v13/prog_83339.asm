; DESCRIPTION: Places a yellow line segment connecting (273, 143) to (9, 147).
; PLAN: r0=273(x1), r1=143(y1), r2=9(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 143
LDI r2, 9
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
