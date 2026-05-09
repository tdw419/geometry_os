; DESCRIPTION: Places a red line segment connecting (462, 108) to (147, 148).
; PLAN: r0=462(x1), r1=108(y1), r2=147(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 108
LDI r2, 147
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
