; DESCRIPTION: Renders a orange line between points (221, 145) and (449, 34).
; PLAN: r0=221(x1), r1=145(y1), r2=449(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 145
LDI r2, 449
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
