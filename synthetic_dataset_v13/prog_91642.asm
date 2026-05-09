; DESCRIPTION: Places a orange line segment connecting (505, 10) to (439, 168).
; PLAN: r0=505(x1), r1=10(y1), r2=439(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 10
LDI r2, 439
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
