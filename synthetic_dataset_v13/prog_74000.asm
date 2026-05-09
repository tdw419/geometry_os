; DESCRIPTION: Renders a orange line between points (162, 126) and (483, 142).
; PLAN: r0=162(x1), r1=126(y1), r2=483(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 126
LDI r2, 483
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
