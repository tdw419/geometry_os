; DESCRIPTION: Renders a orange line between points (335, 218) and (375, 191).
; PLAN: r0=335(x1), r1=218(y1), r2=375(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 218
LDI r2, 375
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
