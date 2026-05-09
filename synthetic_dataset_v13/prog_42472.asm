; DESCRIPTION: Renders a orange line between points (449, 84) and (87, 144).
; PLAN: r0=449(x1), r1=84(y1), r2=87(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 84
LDI r2, 87
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
