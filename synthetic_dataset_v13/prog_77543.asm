; DESCRIPTION: Draws a orange line from (172, 247) to (329, 1).
; PLAN: r0=172(x1), r1=247(y1), r2=329(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 247
LDI r2, 329
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
