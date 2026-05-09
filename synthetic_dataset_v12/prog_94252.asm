; DESCRIPTION: Places a orange line segment connecting (107, 92) to (506, 102).
; PLAN: r0=107(x1), r1=92(y1), r2=506(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 92
LDI r2, 506
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
