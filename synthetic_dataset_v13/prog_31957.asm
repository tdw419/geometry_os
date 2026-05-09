; DESCRIPTION: Places a orange line segment connecting (164, 119) to (45, 44).
; PLAN: r0=164(x1), r1=119(y1), r2=45(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 119
LDI r2, 45
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
