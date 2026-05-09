; DESCRIPTION: Renders a orange line between points (363, 110) and (467, 59).
; PLAN: r0=363(x1), r1=110(y1), r2=467(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 110
LDI r2, 467
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
