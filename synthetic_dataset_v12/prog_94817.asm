; DESCRIPTION: Draws a orange line from (463, 103) to (89, 145).
; PLAN: r0=463(x1), r1=103(y1), r2=89(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 103
LDI r2, 89
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
