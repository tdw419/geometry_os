; DESCRIPTION: Places a orange line segment connecting (37, 169) to (283, 103).
; PLAN: r0=37(x1), r1=169(y1), r2=283(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 169
LDI r2, 283
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
