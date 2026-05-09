; DESCRIPTION: Renders a orange line between points (134, 254) and (363, 193).
; PLAN: r0=134(x1), r1=254(y1), r2=363(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 254
LDI r2, 363
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
