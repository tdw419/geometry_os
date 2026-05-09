; DESCRIPTION: Renders a orange line between points (360, 195) and (483, 185).
; PLAN: r0=360(x1), r1=195(y1), r2=483(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 195
LDI r2, 483
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
