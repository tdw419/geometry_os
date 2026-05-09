; DESCRIPTION: Places a orange line segment connecting (308, 234) to (407, 10).
; PLAN: r0=308(x1), r1=234(y1), r2=407(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 234
LDI r2, 407
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
