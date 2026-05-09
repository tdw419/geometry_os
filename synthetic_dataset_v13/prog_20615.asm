; DESCRIPTION: Places a orange line segment connecting (406, 95) to (162, 126).
; PLAN: r0=406(x1), r1=95(y1), r2=162(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 95
LDI r2, 162
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
