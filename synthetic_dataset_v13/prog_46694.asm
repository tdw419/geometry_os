; DESCRIPTION: Places a orange line segment connecting (454, 141) to (360, 90).
; PLAN: r0=454(x1), r1=141(y1), r2=360(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 141
LDI r2, 360
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
