; DESCRIPTION: Renders a orange line between points (181, 15) and (1, 75).
; PLAN: r0=181(x1), r1=15(y1), r2=1(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 15
LDI r2, 1
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
