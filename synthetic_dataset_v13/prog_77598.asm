; DESCRIPTION: Places a orange line segment connecting (363, 167) to (19, 102).
; PLAN: r0=363(x1), r1=167(y1), r2=19(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 167
LDI r2, 19
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
