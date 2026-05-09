; DESCRIPTION: Draws a orange line from (451, 104) to (248, 53).
; PLAN: r0=451(x1), r1=104(y1), r2=248(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 104
LDI r2, 248
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
