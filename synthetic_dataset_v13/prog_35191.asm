; DESCRIPTION: Draws a orange line from (311, 89) to (104, 174).
; PLAN: r0=311(x1), r1=89(y1), r2=104(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 89
LDI r2, 104
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
