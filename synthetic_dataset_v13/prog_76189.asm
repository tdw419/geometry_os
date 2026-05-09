; DESCRIPTION: Places a orange line segment connecting (159, 80) to (339, 65).
; PLAN: r0=159(x1), r1=80(y1), r2=339(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 80
LDI r2, 339
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
