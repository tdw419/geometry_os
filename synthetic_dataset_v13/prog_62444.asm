; DESCRIPTION: Places a orange line segment connecting (39, 53) to (507, 222).
; PLAN: r0=39(x1), r1=53(y1), r2=507(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 53
LDI r2, 507
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
