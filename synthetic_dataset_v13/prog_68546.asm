; DESCRIPTION: Draws a orange line from (461, 104) to (283, 18).
; PLAN: r0=461(x1), r1=104(y1), r2=283(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 104
LDI r2, 283
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
