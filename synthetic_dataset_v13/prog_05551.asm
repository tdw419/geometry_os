; DESCRIPTION: Renders a orange line between points (489, 105) and (1, 73).
; PLAN: r0=489(x1), r1=105(y1), r2=1(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 105
LDI r2, 1
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
