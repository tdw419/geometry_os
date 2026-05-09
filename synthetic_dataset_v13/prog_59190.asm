; DESCRIPTION: Places a orange line segment connecting (212, 247) to (112, 112).
; PLAN: r0=212(x1), r1=247(y1), r2=112(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 247
LDI r2, 112
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
