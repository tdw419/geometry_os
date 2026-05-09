; DESCRIPTION: Renders a orange line between points (219, 85) and (449, 119).
; PLAN: r0=219(x1), r1=85(y1), r2=449(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 85
LDI r2, 449
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
