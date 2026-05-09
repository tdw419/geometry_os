; DESCRIPTION: Renders a orange line between points (249, 100) and (302, 178).
; PLAN: r0=249(x1), r1=100(y1), r2=302(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 100
LDI r2, 302
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
