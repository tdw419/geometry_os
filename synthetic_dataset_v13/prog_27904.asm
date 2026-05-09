; DESCRIPTION: Places a orange line segment connecting (349, 98) to (162, 114).
; PLAN: r0=349(x1), r1=98(y1), r2=162(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 98
LDI r2, 162
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
