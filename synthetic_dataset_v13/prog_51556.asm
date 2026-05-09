; DESCRIPTION: Renders a orange line between points (451, 180) and (255, 81).
; PLAN: r0=451(x1), r1=180(y1), r2=255(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 180
LDI r2, 255
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
