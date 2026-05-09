; DESCRIPTION: Places a orange line segment connecting (409, 12) to (360, 206).
; PLAN: r0=409(x1), r1=12(y1), r2=360(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 12
LDI r2, 360
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
