; DESCRIPTION: Draws a orange line from (193, 251) to (344, 20).
; PLAN: r0=193(x1), r1=251(y1), r2=344(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 251
LDI r2, 344
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
