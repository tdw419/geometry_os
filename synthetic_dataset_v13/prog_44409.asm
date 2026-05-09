; DESCRIPTION: Renders a orange line between points (193, 62) and (71, 159).
; PLAN: r0=193(x1), r1=62(y1), r2=71(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 62
LDI r2, 71
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
