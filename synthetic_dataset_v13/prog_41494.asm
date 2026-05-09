; DESCRIPTION: Places a yellow line segment connecting (229, 75) to (510, 147).
; PLAN: r0=229(x1), r1=75(y1), r2=510(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 75
LDI r2, 510
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
