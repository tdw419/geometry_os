; DESCRIPTION: Draws a orange line from (151, 10) to (428, 6).
; PLAN: r0=151(x1), r1=10(y1), r2=428(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 10
LDI r2, 428
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
