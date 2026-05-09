; DESCRIPTION: Places a orange line segment connecting (149, 157) to (175, 83).
; PLAN: r0=149(x1), r1=157(y1), r2=175(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 157
LDI r2, 175
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
