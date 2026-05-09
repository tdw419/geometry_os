; DESCRIPTION: Places a orange line segment connecting (131, 36) to (5, 54).
; PLAN: r0=131(x1), r1=36(y1), r2=5(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 36
LDI r2, 5
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
