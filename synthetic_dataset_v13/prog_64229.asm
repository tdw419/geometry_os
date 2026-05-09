; DESCRIPTION: Places a yellow line segment connecting (486, 123) to (437, 147).
; PLAN: r0=486(x1), r1=123(y1), r2=437(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 123
LDI r2, 437
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
