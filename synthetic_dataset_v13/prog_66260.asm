; DESCRIPTION: Renders a orange line between points (465, 89) and (148, 149).
; PLAN: r0=465(x1), r1=89(y1), r2=148(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 89
LDI r2, 148
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
