; DESCRIPTION: Places a orange line segment connecting (150, 36) to (259, 92).
; PLAN: r0=150(x1), r1=36(y1), r2=259(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 36
LDI r2, 259
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
