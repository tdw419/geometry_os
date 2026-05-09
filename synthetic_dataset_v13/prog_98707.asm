; DESCRIPTION: Renders a orange line between points (405, 24) and (266, 89).
; PLAN: r0=405(x1), r1=24(y1), r2=266(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 24
LDI r2, 266
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
