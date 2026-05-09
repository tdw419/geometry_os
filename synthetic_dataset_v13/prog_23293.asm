; DESCRIPTION: Places a orange line segment connecting (18, 143) to (85, 204).
; PLAN: r0=18(x1), r1=143(y1), r2=85(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 143
LDI r2, 85
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
