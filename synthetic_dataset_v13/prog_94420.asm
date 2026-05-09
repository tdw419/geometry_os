; DESCRIPTION: Renders a orange line between points (489, 158) and (448, 124).
; PLAN: r0=489(x1), r1=158(y1), r2=448(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 158
LDI r2, 448
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
