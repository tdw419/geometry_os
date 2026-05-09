; DESCRIPTION: Draws a orange line from (241, 80) to (467, 155).
; PLAN: r0=241(x1), r1=80(y1), r2=467(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 80
LDI r2, 467
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
