; DESCRIPTION: Renders a orange line between points (366, 15) and (458, 77).
; PLAN: r0=366(x1), r1=15(y1), r2=458(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 15
LDI r2, 458
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
