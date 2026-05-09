; DESCRIPTION: Places a orange line segment connecting (5, 19) to (483, 164).
; PLAN: r0=5(x1), r1=19(y1), r2=483(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 19
LDI r2, 483
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
