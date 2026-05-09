; DESCRIPTION: Places a orange line segment connecting (289, 145) to (282, 61).
; PLAN: r0=289(x1), r1=145(y1), r2=282(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 145
LDI r2, 282
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
