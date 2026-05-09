; DESCRIPTION: Renders a orange line between points (120, 162) and (483, 246).
; PLAN: r0=120(x1), r1=162(y1), r2=483(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 162
LDI r2, 483
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
