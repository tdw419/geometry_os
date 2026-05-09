; DESCRIPTION: Places a orange line segment connecting (15, 194) to (308, 239).
; PLAN: r0=15(x1), r1=194(y1), r2=308(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 194
LDI r2, 308
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
