; DESCRIPTION: Draws a orange line from (343, 78) to (492, 200).
; PLAN: r0=343(x1), r1=78(y1), r2=492(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 78
LDI r2, 492
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
