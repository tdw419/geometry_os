; DESCRIPTION: Renders a orange line between points (131, 85) and (147, 221).
; PLAN: r0=131(x1), r1=85(y1), r2=147(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 85
LDI r2, 147
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
