; DESCRIPTION: Draws a orange line from (489, 170) to (104, 171).
; PLAN: r0=489(x1), r1=170(y1), r2=104(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 170
LDI r2, 104
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
