; DESCRIPTION: Renders a orange line between points (351, 229) and (47, 35).
; PLAN: r0=351(x1), r1=229(y1), r2=47(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 229
LDI r2, 47
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
