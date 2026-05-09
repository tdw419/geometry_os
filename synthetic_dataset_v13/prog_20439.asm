; DESCRIPTION: Places a orange line segment connecting (411, 175) to (204, 149).
; PLAN: r0=411(x1), r1=175(y1), r2=204(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 175
LDI r2, 204
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
