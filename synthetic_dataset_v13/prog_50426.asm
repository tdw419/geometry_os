; DESCRIPTION: Renders a orange line between points (363, 89) and (276, 86).
; PLAN: r0=363(x1), r1=89(y1), r2=276(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 89
LDI r2, 276
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
