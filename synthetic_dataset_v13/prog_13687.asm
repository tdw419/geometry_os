; DESCRIPTION: Renders a orange line between points (405, 163) and (312, 252).
; PLAN: r0=405(x1), r1=163(y1), r2=312(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 163
LDI r2, 312
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
