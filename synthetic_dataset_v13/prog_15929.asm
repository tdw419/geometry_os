; DESCRIPTION: Renders a orange line between points (110, 99) and (77, 104).
; PLAN: r0=110(x1), r1=99(y1), r2=77(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 99
LDI r2, 77
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
