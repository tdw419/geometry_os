; DESCRIPTION: Places a orange line segment connecting (457, 225) to (474, 247).
; PLAN: r0=457(x1), r1=225(y1), r2=474(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 225
LDI r2, 474
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
