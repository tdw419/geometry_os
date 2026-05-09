; DESCRIPTION: Draws a orange line from (70, 219) to (399, 149).
; PLAN: r0=70(x1), r1=219(y1), r2=399(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 219
LDI r2, 399
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
