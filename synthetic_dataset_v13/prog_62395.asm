; DESCRIPTION: Renders a orange line between points (323, 220) and (51, 147).
; PLAN: r0=323(x1), r1=220(y1), r2=51(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 220
LDI r2, 51
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
