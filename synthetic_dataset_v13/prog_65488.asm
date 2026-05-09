; DESCRIPTION: Renders a orange line between points (105, 52) and (104, 23).
; PLAN: r0=105(x1), r1=52(y1), r2=104(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 52
LDI r2, 104
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
