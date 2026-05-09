; DESCRIPTION: Places a orange line segment connecting (62, 92) to (160, 220).
; PLAN: r0=62(x1), r1=92(y1), r2=160(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 92
LDI r2, 160
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
