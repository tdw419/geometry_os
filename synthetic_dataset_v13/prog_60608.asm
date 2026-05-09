; DESCRIPTION: Draws a orange line from (94, 125) to (301, 150).
; PLAN: r0=94(x1), r1=125(y1), r2=301(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 125
LDI r2, 301
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
