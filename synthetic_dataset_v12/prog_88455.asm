; DESCRIPTION: Places a orange line segment connecting (326, 165) to (304, 108).
; PLAN: r0=326(x1), r1=165(y1), r2=304(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 165
LDI r2, 304
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
