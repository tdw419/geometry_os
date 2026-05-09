; DESCRIPTION: Places a orange line segment connecting (10, 60) to (81, 30).
; PLAN: r0=10(x1), r1=60(y1), r2=81(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 60
LDI r2, 81
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
