; DESCRIPTION: Places a orange line segment connecting (244, 70) to (254, 95).
; PLAN: r0=244(x1), r1=70(y1), r2=254(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 70
LDI r2, 254
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
