; DESCRIPTION: Places a orange line segment connecting (293, 76) to (90, 161).
; PLAN: r0=293(x1), r1=76(y1), r2=90(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 76
LDI r2, 90
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
