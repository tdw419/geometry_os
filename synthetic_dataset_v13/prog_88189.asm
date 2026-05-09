; DESCRIPTION: Places a orange line segment connecting (337, 53) to (218, 167).
; PLAN: r0=337(x1), r1=53(y1), r2=218(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 53
LDI r2, 218
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
