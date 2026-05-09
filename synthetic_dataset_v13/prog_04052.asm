; DESCRIPTION: Draws a orange line from (83, 180) to (2, 102).
; PLAN: r0=83(x1), r1=180(y1), r2=2(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 180
LDI r2, 2
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
