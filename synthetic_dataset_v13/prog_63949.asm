; DESCRIPTION: Renders a orange line between points (451, 217) and (135, 198).
; PLAN: r0=451(x1), r1=217(y1), r2=135(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 217
LDI r2, 135
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
