; DESCRIPTION: Renders a orange line between points (417, 115) and (363, 117).
; PLAN: r0=417(x1), r1=115(y1), r2=363(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 115
LDI r2, 363
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
