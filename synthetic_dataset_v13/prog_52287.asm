; DESCRIPTION: Renders a orange line between points (250, 31) and (118, 25).
; PLAN: r0=250(x1), r1=31(y1), r2=118(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 31
LDI r2, 118
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
