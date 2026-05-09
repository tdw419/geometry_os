; DESCRIPTION: Draws a orange line from (78, 85) to (344, 189).
; PLAN: r0=78(x1), r1=85(y1), r2=344(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 85
LDI r2, 344
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
