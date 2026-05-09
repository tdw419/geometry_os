; DESCRIPTION: Places a orange line segment connecting (480, 52) to (10, 233).
; PLAN: r0=480(x1), r1=52(y1), r2=10(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 52
LDI r2, 10
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
