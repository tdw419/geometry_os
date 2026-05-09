; DESCRIPTION: Places a orange line segment connecting (89, 160) to (114, 178).
; PLAN: r0=89(x1), r1=160(y1), r2=114(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 160
LDI r2, 114
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
