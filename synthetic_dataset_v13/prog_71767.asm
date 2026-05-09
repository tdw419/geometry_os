; DESCRIPTION: Draws a orange line from (437, 199) to (276, 56).
; PLAN: r0=437(x1), r1=199(y1), r2=276(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 199
LDI r2, 276
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
