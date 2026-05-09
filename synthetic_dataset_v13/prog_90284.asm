; DESCRIPTION: Places a orange line segment connecting (83, 227) to (42, 44).
; PLAN: r0=83(x1), r1=227(y1), r2=42(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 227
LDI r2, 42
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
