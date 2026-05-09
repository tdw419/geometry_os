; DESCRIPTION: Places a orange line segment connecting (61, 19) to (439, 87).
; PLAN: r0=61(x1), r1=19(y1), r2=439(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 19
LDI r2, 439
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
