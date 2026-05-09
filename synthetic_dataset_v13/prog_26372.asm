; DESCRIPTION: Renders a orange line between points (197, 79) and (36, 145).
; PLAN: r0=197(x1), r1=79(y1), r2=36(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 79
LDI r2, 36
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
