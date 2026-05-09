; DESCRIPTION: Draws a orange line from (199, 85) to (4, 3).
; PLAN: r0=199(x1), r1=85(y1), r2=4(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 85
LDI r2, 4
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
