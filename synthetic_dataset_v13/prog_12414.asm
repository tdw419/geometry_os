; DESCRIPTION: Places a orange line segment connecting (121, 39) to (53, 85).
; PLAN: r0=121(x1), r1=39(y1), r2=53(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 39
LDI r2, 53
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
