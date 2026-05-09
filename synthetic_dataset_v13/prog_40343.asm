; DESCRIPTION: Renders a orange line between points (132, 113) and (193, 157).
; PLAN: r0=132(x1), r1=113(y1), r2=193(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 113
LDI r2, 193
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
