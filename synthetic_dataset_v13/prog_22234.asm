; DESCRIPTION: Draws a orange line from (343, 192) to (337, 112).
; PLAN: r0=343(x1), r1=192(y1), r2=337(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 192
LDI r2, 337
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
