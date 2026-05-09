; DESCRIPTION: Renders a orange line between points (448, 119) and (205, 48).
; PLAN: r0=448(x1), r1=119(y1), r2=205(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 119
LDI r2, 205
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
