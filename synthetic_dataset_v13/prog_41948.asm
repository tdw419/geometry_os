; DESCRIPTION: Places a orange line segment connecting (474, 44) to (360, 39).
; PLAN: r0=474(x1), r1=44(y1), r2=360(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 44
LDI r2, 360
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
