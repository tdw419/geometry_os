; DESCRIPTION: Draws a orange line from (389, 7) to (44, 194).
; PLAN: r0=389(x1), r1=7(y1), r2=44(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 7
LDI r2, 44
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
