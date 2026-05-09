; DESCRIPTION: Draws a orange line from (100, 94) to (345, 178).
; PLAN: r0=100(x1), r1=94(y1), r2=345(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 94
LDI r2, 345
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
