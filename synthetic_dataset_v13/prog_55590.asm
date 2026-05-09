; DESCRIPTION: Draws a orange line from (317, 138) to (10, 78).
; PLAN: r0=317(x1), r1=138(y1), r2=10(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 138
LDI r2, 10
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
