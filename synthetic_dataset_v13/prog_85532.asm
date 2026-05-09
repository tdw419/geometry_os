; DESCRIPTION: Renders a orange line between points (347, 89) and (96, 233).
; PLAN: r0=347(x1), r1=89(y1), r2=96(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 89
LDI r2, 96
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
