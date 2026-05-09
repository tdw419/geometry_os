; DESCRIPTION: Places a orange line segment connecting (231, 124) to (461, 203).
; PLAN: r0=231(x1), r1=124(y1), r2=461(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 124
LDI r2, 461
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
