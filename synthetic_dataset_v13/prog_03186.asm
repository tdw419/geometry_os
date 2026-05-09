; DESCRIPTION: Places a orange line segment connecting (387, 18) to (363, 102).
; PLAN: r0=387(x1), r1=18(y1), r2=363(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 18
LDI r2, 363
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
