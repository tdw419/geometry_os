; DESCRIPTION: Renders a orange line between points (61, 147) and (339, 169).
; PLAN: r0=61(x1), r1=147(y1), r2=339(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 147
LDI r2, 339
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
