; DESCRIPTION: Places a orange line segment connecting (244, 202) to (467, 100).
; PLAN: r0=244(x1), r1=202(y1), r2=467(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 202
LDI r2, 467
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
