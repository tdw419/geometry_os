; DESCRIPTION: Places a orange line segment connecting (467, 15) to (219, 244).
; PLAN: r0=467(x1), r1=15(y1), r2=219(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 15
LDI r2, 219
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
