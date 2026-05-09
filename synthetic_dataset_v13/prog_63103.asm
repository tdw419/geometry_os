; DESCRIPTION: Draws a orange line from (113, 105) to (428, 63).
; PLAN: r0=113(x1), r1=105(y1), r2=428(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 105
LDI r2, 428
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
