; DESCRIPTION: Places a orange line segment connecting (376, 74) to (85, 83).
; PLAN: r0=376(x1), r1=74(y1), r2=85(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 74
LDI r2, 85
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
