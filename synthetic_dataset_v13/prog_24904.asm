; DESCRIPTION: Places a orange line segment connecting (236, 2) to (238, 222).
; PLAN: r0=236(x1), r1=2(y1), r2=238(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 2
LDI r2, 238
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
