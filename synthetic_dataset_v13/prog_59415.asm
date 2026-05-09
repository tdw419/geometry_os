; DESCRIPTION: Renders a orange line between points (40, 34) and (459, 2).
; PLAN: r0=40(x1), r1=34(y1), r2=459(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 34
LDI r2, 459
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
