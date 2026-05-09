; DESCRIPTION: Places a orange line segment connecting (37, 0) to (381, 207).
; PLAN: r0=37(x1), r1=0(y1), r2=381(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 0
LDI r2, 381
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
