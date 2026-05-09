; DESCRIPTION: Renders a orange line between points (448, 219) and (303, 158).
; PLAN: r0=448(x1), r1=219(y1), r2=303(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 219
LDI r2, 303
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
