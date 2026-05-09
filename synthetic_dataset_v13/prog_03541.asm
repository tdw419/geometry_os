; DESCRIPTION: Renders a orange line between points (299, 90) and (316, 245).
; PLAN: r0=299(x1), r1=90(y1), r2=316(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 90
LDI r2, 316
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
