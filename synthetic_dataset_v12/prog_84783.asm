; DESCRIPTION: Draws a orange line from (376, 199) to (437, 67).
; PLAN: r0=376(x1), r1=199(y1), r2=437(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 199
LDI r2, 437
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
