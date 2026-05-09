; DESCRIPTION: Renders a orange line between points (414, 232) and (190, 150).
; PLAN: r0=414(x1), r1=232(y1), r2=190(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 232
LDI r2, 190
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
