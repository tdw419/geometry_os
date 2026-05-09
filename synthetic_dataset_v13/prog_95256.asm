; DESCRIPTION: Draws a orange line from (339, 117) to (252, 185).
; PLAN: r0=339(x1), r1=117(y1), r2=252(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 117
LDI r2, 252
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
