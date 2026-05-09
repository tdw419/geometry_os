; DESCRIPTION: Places a orange line segment connecting (205, 247) to (81, 185).
; PLAN: r0=205(x1), r1=247(y1), r2=81(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 247
LDI r2, 81
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
