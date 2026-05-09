; DESCRIPTION: Draws a orange line from (359, 113) to (138, 247).
; PLAN: r0=359(x1), r1=113(y1), r2=138(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 113
LDI r2, 138
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
