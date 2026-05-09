; DESCRIPTION: Places a orange line segment connecting (168, 135) to (37, 194).
; PLAN: r0=168(x1), r1=135(y1), r2=37(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 135
LDI r2, 37
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
