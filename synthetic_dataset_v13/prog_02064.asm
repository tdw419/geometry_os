; DESCRIPTION: Places a orange line segment connecting (180, 95) to (244, 168).
; PLAN: r0=180(x1), r1=95(y1), r2=244(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 95
LDI r2, 244
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
