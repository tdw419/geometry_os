; DESCRIPTION: Places a orange line segment connecting (87, 226) to (477, 122).
; PLAN: r0=87(x1), r1=226(y1), r2=477(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 226
LDI r2, 477
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
