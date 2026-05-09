; DESCRIPTION: Draws a yellow line from (507, 85) to (390, 31).
; PLAN: r0=507(x1), r1=85(y1), r2=390(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 85
LDI r2, 390
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
