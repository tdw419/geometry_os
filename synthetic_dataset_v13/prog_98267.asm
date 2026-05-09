; DESCRIPTION: Places a orange line segment connecting (406, 87) to (130, 206).
; PLAN: r0=406(x1), r1=87(y1), r2=130(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 87
LDI r2, 130
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
