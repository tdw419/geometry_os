; DESCRIPTION: Renders a orange line between points (120, 179) and (363, 114).
; PLAN: r0=120(x1), r1=179(y1), r2=363(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 179
LDI r2, 363
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
