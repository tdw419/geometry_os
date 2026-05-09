; DESCRIPTION: Draws a orange line from (467, 57) to (472, 165).
; PLAN: r0=467(x1), r1=57(y1), r2=472(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 57
LDI r2, 472
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
