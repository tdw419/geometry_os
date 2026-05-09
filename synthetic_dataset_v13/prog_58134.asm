; DESCRIPTION: Places a orange line segment connecting (301, 46) to (74, 77).
; PLAN: r0=301(x1), r1=46(y1), r2=74(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 46
LDI r2, 74
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
