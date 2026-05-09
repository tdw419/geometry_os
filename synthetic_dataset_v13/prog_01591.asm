; DESCRIPTION: Renders a orange line between points (103, 75) and (451, 57).
; PLAN: r0=103(x1), r1=75(y1), r2=451(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 75
LDI r2, 451
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
