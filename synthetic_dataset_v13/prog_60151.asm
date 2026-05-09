; DESCRIPTION: Renders a green line between points (395, 79) and (451, 90).
; PLAN: r0=395(x1), r1=79(y1), r2=451(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 79
LDI r2, 451
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
