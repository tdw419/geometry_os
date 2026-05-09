; DESCRIPTION: Renders a orange line between points (8, 79) and (219, 35).
; PLAN: r0=8(x1), r1=79(y1), r2=219(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 79
LDI r2, 219
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
