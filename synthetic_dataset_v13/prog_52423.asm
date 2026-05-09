; DESCRIPTION: Places a orange line segment connecting (193, 92) to (301, 118).
; PLAN: r0=193(x1), r1=92(y1), r2=301(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 92
LDI r2, 301
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
