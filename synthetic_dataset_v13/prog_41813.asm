; DESCRIPTION: Places a orange line segment connecting (393, 117) to (283, 137).
; PLAN: r0=393(x1), r1=117(y1), r2=283(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 117
LDI r2, 283
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
