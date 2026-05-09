; DESCRIPTION: Places a orange line segment connecting (421, 131) to (276, 65).
; PLAN: r0=421(x1), r1=131(y1), r2=276(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 131
LDI r2, 276
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
