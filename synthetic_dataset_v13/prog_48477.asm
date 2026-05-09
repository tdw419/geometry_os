; DESCRIPTION: Renders a orange line between points (279, 174) and (13, 100).
; PLAN: r0=279(x1), r1=174(y1), r2=13(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 174
LDI r2, 13
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
