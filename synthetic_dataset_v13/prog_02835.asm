; DESCRIPTION: Places a orange line segment connecting (69, 211) to (283, 139).
; PLAN: r0=69(x1), r1=211(y1), r2=283(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 211
LDI r2, 283
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
