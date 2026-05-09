; DESCRIPTION: Renders a orange line between points (449, 43) and (427, 36).
; PLAN: r0=449(x1), r1=43(y1), r2=427(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 43
LDI r2, 427
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
