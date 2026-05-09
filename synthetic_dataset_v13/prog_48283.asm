; DESCRIPTION: Renders a orange line between points (423, 22) and (104, 18).
; PLAN: r0=423(x1), r1=22(y1), r2=104(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 22
LDI r2, 104
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
