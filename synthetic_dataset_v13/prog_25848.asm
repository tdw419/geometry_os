; DESCRIPTION: Places a orange line segment connecting (407, 82) to (317, 238).
; PLAN: r0=407(x1), r1=82(y1), r2=317(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 82
LDI r2, 317
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
