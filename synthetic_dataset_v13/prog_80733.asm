; DESCRIPTION: Places a orange line segment connecting (176, 108) to (26, 194).
; PLAN: r0=176(x1), r1=108(y1), r2=26(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 108
LDI r2, 26
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
