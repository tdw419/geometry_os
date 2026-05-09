; DESCRIPTION: Places a red line segment connecting (314, 2) to (302, 29).
; PLAN: r0=314(x1), r1=2(y1), r2=302(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 2
LDI r2, 302
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
