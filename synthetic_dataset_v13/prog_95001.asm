; DESCRIPTION: Places a orange line segment connecting (440, 227) to (468, 83).
; PLAN: r0=440(x1), r1=227(y1), r2=468(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 227
LDI r2, 468
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
