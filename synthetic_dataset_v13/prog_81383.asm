; DESCRIPTION: Renders a orange line between points (34, 12) and (80, 73).
; PLAN: r0=34(x1), r1=12(y1), r2=80(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 12
LDI r2, 80
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
