; DESCRIPTION: Draws a orange line from (1, 23) to (78, 202).
; PLAN: r0=1(x1), r1=23(y1), r2=78(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 23
LDI r2, 78
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
