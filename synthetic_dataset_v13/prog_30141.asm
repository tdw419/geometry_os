; DESCRIPTION: Places a blue line segment connecting (303, 110) to (147, 234).
; PLAN: r0=303(x1), r1=110(y1), r2=147(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 110
LDI r2, 147
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
