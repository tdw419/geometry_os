; DESCRIPTION: Draws a orange line from (426, 134) to (141, 102).
; PLAN: r0=426(x1), r1=134(y1), r2=141(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 134
LDI r2, 141
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
