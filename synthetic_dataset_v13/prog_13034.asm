; DESCRIPTION: Renders a orange line between points (507, 56) and (468, 147).
; PLAN: r0=507(x1), r1=56(y1), r2=468(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 56
LDI r2, 468
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
