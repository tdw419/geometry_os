; DESCRIPTION: Places a orange line segment connecting (442, 2) to (449, 72).
; PLAN: r0=442(x1), r1=2(y1), r2=449(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 2
LDI r2, 449
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
