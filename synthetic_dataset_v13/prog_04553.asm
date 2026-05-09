; DESCRIPTION: Places a orange line segment connecting (510, 29) to (457, 126).
; PLAN: r0=510(x1), r1=29(y1), r2=457(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 29
LDI r2, 457
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
