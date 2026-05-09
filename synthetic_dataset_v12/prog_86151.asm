; DESCRIPTION: Renders a orange line between points (437, 25) and (451, 95).
; PLAN: r0=437(x1), r1=25(y1), r2=451(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 25
LDI r2, 451
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
