; DESCRIPTION: Places a orange line segment connecting (62, 163) to (294, 162).
; PLAN: r0=62(x1), r1=163(y1), r2=294(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 163
LDI r2, 294
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
