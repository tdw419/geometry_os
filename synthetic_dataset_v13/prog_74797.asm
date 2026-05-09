; DESCRIPTION: Places a orange line segment connecting (161, 157) to (341, 180).
; PLAN: r0=161(x1), r1=157(y1), r2=341(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 157
LDI r2, 341
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
