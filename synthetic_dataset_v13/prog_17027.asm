; DESCRIPTION: Draws a orange line from (366, 140) to (2, 135).
; PLAN: r0=366(x1), r1=140(y1), r2=2(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 140
LDI r2, 2
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
