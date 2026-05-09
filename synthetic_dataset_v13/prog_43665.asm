; DESCRIPTION: Renders a orange line between points (14, 212) and (472, 169).
; PLAN: r0=14(x1), r1=212(y1), r2=472(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 212
LDI r2, 472
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
