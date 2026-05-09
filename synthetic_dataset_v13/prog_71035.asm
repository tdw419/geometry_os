; DESCRIPTION: Places a orange line segment connecting (46, 70) to (258, 45).
; PLAN: r0=46(x1), r1=70(y1), r2=258(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 70
LDI r2, 258
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
