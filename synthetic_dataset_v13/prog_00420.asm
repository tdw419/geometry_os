; DESCRIPTION: Renders a orange line between points (104, 119) and (332, 184).
; PLAN: r0=104(x1), r1=119(y1), r2=332(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 119
LDI r2, 332
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
