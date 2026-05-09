; DESCRIPTION: Places a orange line segment connecting (460, 145) to (461, 145).
; PLAN: r0=460(x1), r1=145(y1), r2=461(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 145
LDI r2, 461
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
