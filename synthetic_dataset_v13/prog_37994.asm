; DESCRIPTION: Renders a orange line between points (390, 96) and (106, 28).
; PLAN: r0=390(x1), r1=96(y1), r2=106(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 96
LDI r2, 106
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
