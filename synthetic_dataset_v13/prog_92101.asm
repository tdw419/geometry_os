; DESCRIPTION: Places a orange line segment connecting (352, 5) to (138, 23).
; PLAN: r0=352(x1), r1=5(y1), r2=138(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 5
LDI r2, 138
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
