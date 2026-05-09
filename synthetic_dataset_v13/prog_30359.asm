; DESCRIPTION: Places a orange line segment connecting (486, 14) to (199, 13).
; PLAN: r0=486(x1), r1=14(y1), r2=199(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 14
LDI r2, 199
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
