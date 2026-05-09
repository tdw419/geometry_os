; DESCRIPTION: Renders a white line between points (7, 57) and (451, 145).
; PLAN: r0=7(x1), r1=57(y1), r2=451(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 57
LDI r2, 451
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
