; DESCRIPTION: Places a orange line segment connecting (449, 184) to (343, 152).
; PLAN: r0=449(x1), r1=184(y1), r2=343(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 184
LDI r2, 343
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
