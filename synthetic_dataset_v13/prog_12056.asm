; DESCRIPTION: Renders a orange line between points (110, 73) and (503, 3).
; PLAN: r0=110(x1), r1=73(y1), r2=503(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 73
LDI r2, 503
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
