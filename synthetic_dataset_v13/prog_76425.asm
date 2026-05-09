; DESCRIPTION: Renders a orange line between points (245, 63) and (201, 185).
; PLAN: r0=245(x1), r1=63(y1), r2=201(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 63
LDI r2, 201
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
