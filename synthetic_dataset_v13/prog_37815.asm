; DESCRIPTION: Draws a orange line from (399, 79) to (8, 233).
; PLAN: r0=399(x1), r1=79(y1), r2=8(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 79
LDI r2, 8
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
