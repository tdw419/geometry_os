; DESCRIPTION: Places a orange line segment connecting (271, 157) to (210, 99).
; PLAN: r0=271(x1), r1=157(y1), r2=210(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 157
LDI r2, 210
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
