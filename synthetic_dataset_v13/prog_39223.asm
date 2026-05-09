; DESCRIPTION: Places a orange line segment connecting (117, 128) to (443, 201).
; PLAN: r0=117(x1), r1=128(y1), r2=443(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 128
LDI r2, 443
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
