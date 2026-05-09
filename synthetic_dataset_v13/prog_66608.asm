; DESCRIPTION: Draws a orange line from (458, 241) to (339, 211).
; PLAN: r0=458(x1), r1=241(y1), r2=339(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 241
LDI r2, 339
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
