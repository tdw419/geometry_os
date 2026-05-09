; DESCRIPTION: Renders a orange line between points (325, 18) and (104, 23).
; PLAN: r0=325(x1), r1=18(y1), r2=104(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 18
LDI r2, 104
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
