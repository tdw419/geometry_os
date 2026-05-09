; DESCRIPTION: Places a orange line segment connecting (66, 117) to (8, 76).
; PLAN: r0=66(x1), r1=117(y1), r2=8(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 117
LDI r2, 8
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
